{ pkgs }:
pkgs.mkShell {
    inputsFrom = import ./package.nix { inherit pkgs; };
}
