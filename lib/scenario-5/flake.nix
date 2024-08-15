{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ { flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" ];

    perSystem = { pkgs, ... }: {
      packages.default = pkgs.stdenv.mkDerivation {
        name = "datetime";

        src = ./src;

        buildPhase = ''
          $CC datetime.c -o datetime
        '';

        installPhase = ''
          install -D datetime $out/bin/datetime
        '';
      };
    };
  };
}
