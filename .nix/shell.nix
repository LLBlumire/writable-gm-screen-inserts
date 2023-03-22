{ pkgs }:
pkgs.mkShell {
    buildInputs = with pkgs; [ typst ];
}
