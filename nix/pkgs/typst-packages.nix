{ stdenvNoCC, src }:

stdenvNoCC.mkDerivation {
  name = "typst-packages";

  inherit src;

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/typst/packages
    cp -r packages/preview $out/typst/packages/

    runHook postInstall
  '';
}
