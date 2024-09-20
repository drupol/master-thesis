{ stdenvNoCC, inputs }:

stdenvNoCC.mkDerivation {
  name = "typst-packages";

  src = inputs.typst-packages;

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/typst/packages
    cp -r packages/preview $out/typst/packages/

    runHook postInstall
  '';
}
