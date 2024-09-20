{ pkgs, ... }:
pkgs.writeShellApplication {
  name = "sign-pdf";

  runtimeInputs = [ pkgs.open-pdf-sign ];

  text = ''
    open-pdf-sign \
      --certificate cert.pem \
      --key private-key.pem \
      --no-hint \
      --timestamp \
      --tsa http://timestamp.digicert.com \
      --baseline-lt \
      --add-page \
      --page \
      -1 \
      --width 19 \
      "$@"
  '';
}
