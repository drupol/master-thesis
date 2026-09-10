{ inputs, ... }:
{
  flake-file.inputs = {
    git-hooks.url = "github:cachix/git-hooks.nix";
    json-sort.url = "github:drupol/json-sort";
    pedantix.url = "github:swarsel/pedantix";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  imports = [
    inputs.treefmt-nix.flakeModule
    inputs.git-hooks.flakeModule
    inputs.pedantix.flakeModules.default
  ];

  perSystem =
    { lib, pkgs, ... }:
    {
      treefmt = {
        imports = [
          inputs.json-sort.treefmtModules.default
        ];

        programs = {
          deadnix.enable = true;
          json-sort.enable = true;

          nixfmt = {
            enable = true;
            package = pkgs.nixfmt-rs;
          };

          pedantix = {
            enable = true;

            excludes = [
              "flake.nix"
              "default.nix"
            ];

            package = pkgs.pedantix;
            priority = -2;
          };

          prettier.enable = true;
          shellcheck.enable = true;
          shfmt.enable = true;
          typstyle.enable = true;
          yamlfmt.enable = true;
        };

        projectRootFile = "flake.nix";

        settings = {
          formatter = {
            bibtex-tidy = {
              command = lib.getExe pkgs.bibtex-tidy;
              includes = [ "*.bib" ];
            };

            dockerfmt = {
              command = lib.getExe pkgs.dockerfmt;

              includes = [
                "*.dockerfile"
                "Containerfile"
              ];
            };
          };

          global.excludes = [
            ".editorconfig"
            ".prettierrc"
            "LICENSE"
            "tests/lib/bashunit"
            ".prettierignore"
            ".shellcheckrc"
            "*.pdf"
            "*.png"
            "*.pem"
            "*.key"
            ".envrc"
            ".github/CODEOWNERS"
            "CITATION.cff"
            "lib/**"
            "*.pl"
            "*.dot"
            "*.svg"
            "*.jpeg"
            "*.jpg"
            "*.log"
            "*.c"
            "resources/sourcecode/example-makefile"
            "nix/pkgs/passive/passive.sh"
            "nix/pkgs/weasel/weasel.sh"
            "*.dockerfile"
            "*.original"
          ];

          no-cache = true;
          on-unmatched = "warn";
        };
      };
    };
}
