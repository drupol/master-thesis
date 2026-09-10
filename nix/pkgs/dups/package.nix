{
  perl,
  writeShellApplication,
}:

writeShellApplication {
  name = "dups";
  runtimeInputs = [ perl ];

  text = ''
    perl ${./dups.pl} "$@"
  '';
}
