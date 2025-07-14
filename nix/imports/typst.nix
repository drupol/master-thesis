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
        (p.diagraph.overrideAttrs (oldAttrs: {
          version = "0.3.5";
          src = pkgs.fetchzip {
            hash = "sha256-diUbQHUePKawZLOYc09LgfH8dgENl6xWmKL42AfgYM4=";
            url = "https://packages.typst.org/preview/diagraph-0.3.5.tar.gz";
            stripRoot = false;
          };
        }))
        p.codly
        p.codly-languages
        (p.glossarium.overrideAttrs (oldAttrs: {
          version = "0.5.7";
          src = pkgs.fetchzip {
            hash = "sha256-5+1SaEv+x4rXLNcuYQTgEegt7U1V8CWo4CY1ctM0LHA=";
            url = "https://packages.typst.org/preview/glossarium-0.5.7.tar.gz";
            stripRoot = false;
          };
        }))
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
        lib.filterAttrs (k: v: (v == "directory")) (builtins.readDir ../../src)
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
