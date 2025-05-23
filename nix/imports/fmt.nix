{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem = {
    treefmt = {
      projectRootFile = "flake.nix";
      programs = {
        nixfmt.enable = true;
        prettier.enable = true;
        shfmt.enable = true;
        shellcheck.enable = true;
        typstyle.enable = true;
      };
      settings = {
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
          "*.bib"
          "nix/pkgs/passive/passive.sh"
          "nix/pkgs/weasel/weasel.sh"
        ];
      };
    };
  };
}
