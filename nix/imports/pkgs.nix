{ inputs, self, ... }:
{
  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import self.inputs.nixpkgs {
        inherit system;
        overlays = [
          inputs.typst-dev.overlays.default
          (final: prev: { nixpkgs-unstable = import inputs.nixpkgs-unstable { inherit system; }; })
        ];
      };
    };
}
