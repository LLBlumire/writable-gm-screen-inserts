{ pkgs }:
pkgs.stdenv.mkDerivation {
    name = "writable-gm-screen-inserts";
    src = ../.;
    nativeBuildInputs = with pkgs; [ typst ];
    buildPhase = ''
        typst *.typst
    '';
    installPhase = ''
        mkdir -p $out
        cp *.pdf $out
    '';
}
