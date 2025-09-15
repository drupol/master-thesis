{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem =
    { pkgs, lib, ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";
        programs = {
          deadnix.enable = true;
          nixfmt.enable = true;
          prettier.enable = true;
          shfmt.enable = true;
          shellcheck.enable = true;
          typstyle.enable = true;
        };
        settings = {
          formatter = {
            bibtex-tidy = {
              command = "${lib.getExe pkgs.bibtex-tidy}";
              includes = [ "*.bib" ];
            };
          };
          on-unmatched = "fatal";
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
            "*.dockerfile"
            "nix/pkgs/passive/passive.sh"
            "nix/pkgs/weasel/weasel.sh"
          ];
        };
      };
    };
}
