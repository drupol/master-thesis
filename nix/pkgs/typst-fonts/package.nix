{
  symlinkJoin,
  inriafonts,
  fg-virgil,
  liberation_ttf,
  nerd-fonts,
  newcomputermodern,
}:

symlinkJoin {
  name = "typst-fonts";
  paths = [
    inriafonts
    fg-virgil
    liberation_ttf
    nerd-fonts.inconsolata
    newcomputermodern
  ];
}
