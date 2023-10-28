{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ { flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" ];

    perSystem = { pkgs, ... }: {
      packages.default = pkgs.stdenv.mkDerivation {
        name = "typst-hello-world";

        src = ./src;

        nativeBuildInputs = [ pkgs.typst ];

        buildPhase = ''
          typst compile hello-world.typst hello-world.pdf
        '';

        installPhase = ''
          install -D hello-world.pdf $out/hello-world.pdf
        '';
      };
    };
  };
}
