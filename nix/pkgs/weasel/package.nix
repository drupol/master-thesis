{
  writeShellApplication,
}:

writeShellApplication {
  name = "weasel";

  text = (builtins.readFile ./weasel.sh);
}
