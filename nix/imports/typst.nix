{ inputs, ... }:
{
  imports = [ inputs.make-shell.flakeModules.default ];

  perSystem =
    {
      pkgs,
      lib,
      ...
    }:
    let
      typst = pkgs.typst.withPackages (p: [
        p.diagraph
        p.codly
        p.codly-languages
        p.glossarium
        p.xarrow
        p.hydra
        p.cetz
        p.cetz-plot
      ]);

      typst-fonts = pkgs.symlinkJoin {
        name = "typst-fonts";
        paths = with pkgs; [
          inriafonts
          fg-virgil
          liberation_ttf
          nerd-fonts.inconsolata
          newcomputermodern
        ];
      };

      mkTypstScript =
        action: documentName:
        pkgs.writeShellApplication {
          name = "typst-${action}-${documentName}";

          runtimeInputs = [ typst ];

          text = ''
            ${lib.getExe typst} \
              ${action} \
              --root ./. \
              --input rev="${inputs.self.rev or ""}" \
              --input shortRev="${inputs.self.shortRev or ""}" \
              --input builddate="$(date -u -d @${toString (inputs.self.lastModified or "")})" \
              --font-path ${typst-fonts} \
              --ignore-system-fonts \
              ./src/${documentName}/main.typ \
              ${documentName}.pdf
          '';
        };

      mkBuildDocumentDrv =
        action: documentName:
        pkgs.stdenvNoCC.mkDerivation {
          pname = "typst-${action}-${documentName}";
          version = "0.0.1";

          src = pkgs.lib.cleanSource ./../../.;

          buildInputs = [ typst ];

          buildPhase = ''
            runHook preBuild

            ${lib.getExe (mkTypstScript "compile" documentName)}

            runHook postBuild
          '';

          installPhase = ''
            runHook preInstall

            install -m640 -D ${documentName}.* -t $out

            runHook postInstall
          '';
        };

      documentDrvs = lib.genAttrs (lib.attrNames (
        lib.filterAttrs (_k: v: (v == "directory")) (builtins.readDir ../../src)
      )) (d: (mkBuildDocumentDrv "compile" d));

      scriptDrvs = lib.foldl' (
        a: i:
        a
        // {
          "compile-${i}" = (mkTypstScript "compile" i);
          "watch-${i}" = (mkTypstScript "watch" i);
        }
      ) { } (lib.attrNames documentDrvs);
    in
    {
      packages = documentDrvs;

      make-shells.default = {
        packages = [ typst ] ++ lib.attrValues scriptDrvs;
        env = {
          TYPST_FONT_PATHS = "${typst-fonts}/share/fonts";
          TYPST_PACKAGE_PATH = "${typst}/lib/typst/packages";
        };
      };

      checks = documentDrvs;
    };
}
