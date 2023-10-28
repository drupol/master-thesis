{
  pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/7872526e9c5332274ea5932a0c3270d6e4724f3b.tar.gz") { }
}:

pkgs.stdenv.mkDerivation {
  name = "datetime";

  src = ./src;

  buildPhase = ''
    $CC datetime.c -o datetime
  '';

  installPhase = ''
    install -D datetime $out/bin/datetime
  '';
}
