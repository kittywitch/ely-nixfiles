{inputs}: let
  tree = inputs.tree.tree {
    inherit inputs;
    folder = ./.;
    config = {
    };
  };
  overlays = [
    (import tree.impure.packages.overlay)
  ];
  nixosConfigurations = import (tree.impure.nixos.machines.default) {
    inherit tree inputs;
  };
  mergeable = inputs.flake-utils.lib.eachDefaultSystem (system: rec {
    pkgs = import inputs.nixpkgs {
      inherit system overlays;
      #config.allowUnfree = true;
    };
    lib = pkgs.lib;
  });
in
  {
    inherit tree overlays nixosConfigurations;
  }
  // mergeable
