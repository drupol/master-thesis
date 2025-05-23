{ inputs, ... }:
{
  imports = [ inputs.make-shell.flakeModules.default ];

  perSystem =
    {
      pkgs,
      config,
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
