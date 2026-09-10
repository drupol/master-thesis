{ inputs, ... }:
{
  flake-file.inputs = {
    make-shell.url = "github:nicknovitski/make-shell";
  };

  imports = [ inputs.make-shell.flakeModules.default ];

  perSystem =
    {
      config,
      pkgs,
      ...
    }:
    {
      make-shells.default = {
        packages = with pkgs; [
          gnuplot
          tinymist
          typstyle
          config.packages.weasel
          config.packages.passive
          config.packages.dups
        ];
      };
    };
}
