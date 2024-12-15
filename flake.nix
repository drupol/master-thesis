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
    pkgs-by-name-for-flake-parts.url = "github:drupol/pkgs-by-name-for-flake-parts";
  };

  outputs =
    inputs@{ ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      imports = [
        inputs.pkgs-by-name-for-flake-parts.flakeModule
        ./nix/imports/pkgs.nix
        inputs.pkgs-by-name-for-flake-parts.flakeModule
      ];

      perSystem =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        let
          # Change here to typst-dev if needed
          typst = pkgs.nixpkgs-unstable.typst;

          fontsConf = pkgs.symlinkJoin {
            name = "typst-fonts";
            paths = with pkgs; [
              inriafonts
              fg-virgil
              liberation_ttf
              nerd-fonts.inconsolata
              newcomputermodern
            ];
          };

          mkBuildDocumentDrv =
            documentName:
            pkgs.stdenvNoCC.mkDerivation {
              name = "build-" + documentName;

              src = pkgs.lib.cleanSource ./.;

              buildInputs = [ typst ];

              buildPhase = ''
                runHook preBuild
                ${lib.getExe typst} \
                  compile \
                  --root ./. \
                  --input rev="${inputs.self.rev or ""}" \
                  --input shortRev="${inputs.self.shortRev or ""}" \
                  --input builddate="$(date -u -d @${toString (inputs.self.lastModified or "")})" \
                  --package-path ${inputs.typst-packages}/packages \
                  --font-path ${fontsConf} \
                  --ignore-system-fonts \
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

              runtimeInputs = [ typst ];

              text = ''
                ${lib.getExe typst} \
                  compile \
                  --root ./. \
                  --input rev="${inputs.self.rev or ""}" \
                  --input shortRev="${inputs.self.shortRev or ""}" \
                  --input builddate="$(date -u -d @${toString (inputs.self.lastModified or "")})" \
                  --package-path ${inputs.typst-packages}/packages \
                  --font-path ${fontsConf} \
                  --ignore-system-fonts \
                  ./src/${documentName}/main.typ \
                  ${documentName}.pdf
              '';
            };

          mkWatchDocumentScript =
            documentName:
            pkgs.writeShellApplication {
              name = "watch-${documentName}";

              runtimeInputs = [ typst ];

              text = ''
                ${lib.getExe typst} \
                  watch \
                  --root ./. \
                  --input rev="${inputs.self.rev or ""}" \
                  --input shortRev="${inputs.self.shortRev or ""}" \
                  --input builddate="$(date -u -d @${toString (inputs.self.lastModified or "")})" \
                  --package-path ${inputs.typst-packages}/packages \
                  --font-path ${fontsConf} \
                  --ignore-system-fonts \
                  ./src/${documentName}/main.typ \
                  ${documentName}.pdf
              '';
            };

          documentDrvs = lib.genAttrs (lib.attrNames (
            lib.filterAttrs (k: v: (v == "directory")) (builtins.readDir ./src)
          )) (d: mkBuildDocumentDrv d);

          scriptDrvs =
            {
              "sign-pdf" = config.packages.sign-pdf;
            }
            // lib.foldl' (
              a: i:
              a
              // {
                "build-${i}" = mkBuildDocumentScript i;
                "watch-${i}" = mkWatchDocumentScript i;
              }
            ) { } (lib.attrNames documentDrvs);
        in
        {
          pkgsDirectory = ./nix/pkgs;
          packages = documentDrvs;

          devShells.default = pkgs.mkShellNoCC {
            packages = (lib.attrValues scriptDrvs) ++ [
              typst
              pkgs.gnuplot
              config.packages.weasel
              config.packages.passive
              config.packages.dups
            ];

            shellHook = ''
              echo "Typst version: ${typst.version}"
              echo "Typst bin: ${lib.getExe typst}"
              echo "Typst packages directory: ${config.packages.typst-packages}"
              echo "Typst fonts directory: ${fontsConf}"
            '';

            env = {
              TYPST_FONT_PATHS = fontsConf;
            };
          };
        };
    };
}
