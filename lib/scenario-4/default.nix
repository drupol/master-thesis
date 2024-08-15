{
  pkgs ? import (fetchTarball { url = "https://github.com/NixOS/nixpkgs/archive/7872526e9c5332274ea5932a0c3270d6e4724f3b.tar.gz"; sha256 = "0ya1nvcjcsadi9vrvjbi2lh6m9fjb759miy1236rkv4xz7j8bgiy"; }) { }
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
