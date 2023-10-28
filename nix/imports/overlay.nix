{ inputs, ... }:
{
  flake = {
    overlays.default = final: prev: {
      typst-packages = prev.callPackage ../pkgs/typst-packages.nix { src = inputs.typst-packages; };
      typst-wrapper = prev.callPackage ../pkgs/typst-wrapper.nix { };
    };
  };
}
