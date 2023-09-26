{inputs, ...} @ args: {
  machine = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = args;
    modules = [./machine.nix];
  };
}
