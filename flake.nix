{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { nixpkgs, flake-utils, ... }:
    let
      buildSystems = with flake-utils.lib.system; [
        x86_64-linux
        aarch64-linux
        x86_64-darwin
        aarch64-darwin
      ];
      mkFlake = (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          devShells = {
            default = import ./.nix/shell.nix { inherit pkgs; };
          };
        });
      flake = flake-utils.lib.eachSystem buildSystems mkFlake;
    in
    flake;
}
