{ lib, writeShellApplication, ... }:

typstDrv: typst-packages: typstFontPaths:
writeShellApplication {
  name = "typst-wrapper";

  runtimeInputs = [
    typstDrv
    typst-packages
  ];

  text = ''
    TYPST_FONT_PATHS=${typstFontPaths} XDG_CACHE_HOME=${typst-packages} ${lib.getExe typstDrv} "$@"
  '';
}
