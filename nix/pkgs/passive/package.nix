{
  writeShellApplication,
}:

writeShellApplication {
  name = "passive";

  text = (builtins.readFile ./passive.sh);
}
