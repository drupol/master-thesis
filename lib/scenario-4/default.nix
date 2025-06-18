{
  pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/e314d5c6d3b3a0f40ec5bcbc007b0cbe412f48ae.tar.gz";
    sha256 = "049zgk55rk6x3m0v7xdcabnayc0l1rbbfvfg9fr9ky92f9g2wl12";
  }) { }
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
