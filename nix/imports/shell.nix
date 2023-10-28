{ inputs, self, ... }:
{
  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import self.inputs.nixpkgs {
        inherit system;
        overlays = [
          inputs.typst-dev.overlays.default
          inputs.self.overlays.default
        ];
        config = {
          allowUnfree = true;
        };
      };
    };
}
