{
  description = "A starter flake for a fox friend";
  inputs = {
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    std = {
      url = "github:chessai/nix-std";
    };
    onevpl = {
      url = "github:oneapi-src/oneVPL";
      flake = false;
    };
    onevpl-intel-gpu = {
      url = "github:oneapi-src/oneVPL-intel-gpu";
      flake = false;
    };
    tree = {
      url = "github:kittywitch/tree";
      inputs.std.follows = "std";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs: import ./outputs.nix {inherit inputs;};
}
