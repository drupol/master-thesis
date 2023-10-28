{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
    typst-dev.url = "github:typst/typst";
    typst-packages = {
      flake = false;
      url = "github:typst/packages";
    };
  };

  outputs =
    inputs@{ ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      imports = [
        ./nix/imports/pkgs.nix
        ./nix/imports/overlay.nix
        ./nix/imports/formatter.nix
      ];

      perSystem =
        { pkgs, lib, ... }:
        let
          # Change here to typst-dev if needed
          typst = pkgs.nixpkgs-unstable.typst;

          fontsConf = pkgs.symlinkJoin {
            name = "typst-fonts";
            paths = with pkgs; [
              inriafonts
              fg-virgil
              liberation_ttf
              inconsolata-nerdfont
              newcomputermodern
            ];
          };

          typst-wrapper = pkgs.typst-wrapper typst pkgs.typst-packages fontsConf;
          typstyle = pkgs.typstyle;

          mkBuildDocumentDrv =
            documentName:
            pkgs.stdenvNoCC.mkDerivation {
              name = "build-" + documentName;

              src = pkgs.lib.cleanSource ./.;

              buildInputs = [ typst-wrapper ];

              buildPhase = ''
                runHook preBuild

                ${lib.getExe typst-wrapper} \
                  compile \
                  --root ./. \
                  --input rev="${inputs.self.rev or ""}" \
                  --input shortRev="${inputs.self.shortRev or ""}" \
                  --input builddate="$(date -u -d @${toString (inputs.self.lastModified or "")})" \
                  --font-path ${fontsConf} \
                  ./src/${documentName}/main.typ \
                  ${documentName}.pdf

                runHook postBuild
              '';

              installPhase = ''
                runHook preInstall

                install -m640 -D ${documentName}.* -t $out

                runHook postInstall
              '';
            };

          mkBuildDocumentScript =
            documentName:
            pkgs.writeShellApplication {
              name = "build-${documentName}";

              runtimeInputs = [ typst-wrapper ];

              text = ''
                ${lib.getExe typst-wrapper} \
                  compile \
                  --root ./. \
                  --input rev="${inputs.self.rev or ""}" \
                  --input shortRev="${inputs.self.shortRev or ""}" \
                  --input builddate="$(date -u -d @${toString (inputs.self.lastModified or "")})" \
                  --font-path ${fontsConf} \
                  ./src/${documentName}/main.typ \
                  ${documentName}.pdf
              '';
            };

          mkWatchDocumentScript =
            documentName:
            pkgs.writeShellApplication {
              name = "watch-${documentName}";

              runtimeInputs = [ typst-wrapper ];

              text = ''
                ${lib.getExe typst-wrapper} \
                  watch \
                  --root ./. \
                  --input rev="${inputs.self.rev or ""}" \
                  --input shortRev="${inputs.self.shortRev or ""}" \
                  --input builddate="$(date -u -d @${toString (inputs.self.lastModified or "")})" \
                  --font-path ${fontsConf} \
                  ./src/${documentName}/main.typ \
                  ${documentName}.pdf
              '';
            };

          documentDrvs = lib.genAttrs (lib.attrNames (
            lib.filterAttrs (k: v: (v == "directory")) (builtins.readDir ./src)
          )) (d: mkBuildDocumentDrv d);

          signPDF = pkgs.writeShellApplication {
            name = "sign-pdf";

            runtimeInputs = [ pkgs.open-pdf-sign ];

            text = ''
              open-pdf-sign \
                --certificate cert.pem \
                --key private-key.pem \
                --no-hint \
                --timestamp \
                --tsa http://timestamp.digicert.com \
                --baseline-lt \
                --add-page \
                --page \
                -1 \
                --width 19 \
                "$@"
            '';
          };

          scriptDrvs = { "sign-pdf" = signPDF; } // lib.foldl' (
            a: i:
            a
            // {
              "build-${i}" = mkBuildDocumentScript i;
              "watch-${i}" = mkWatchDocumentScript i;
            }
          ) { } (lib.attrNames documentDrvs);
        in
        {
          packages = documentDrvs;

          devShells.default = pkgs.mkShellNoCC {
            packages = (lib.attrValues scriptDrvs) ++ [
              typst
              typst-wrapper
              pkgs.gnuplot
              pkgs.pympress
            ];

            shellHook = ''
              echo "Typst version: ${typst.version}"
              echo "Typst bin: ${lib.getExe typst}"
              echo "Typst wrapper bin: ${lib.getExe typst-wrapper}"
              echo "Typst packages directory: ${pkgs.typst-packages}"
              echo "Typst fonts directory: ${fontsConf}"
            '';

            env = {
              TYPST_FONT_PATHS = fontsConf;
            };
          };
        };
    };
}
