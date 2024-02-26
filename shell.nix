{ pkgs ? import ./nixpkgs.nix { } }:

with pkgs;

mkShell {
  buildInputs = [
    haskellPackages.cabal-install
    haskellPackages.haskell-language-server
    nixpkgs-fmt
  ];
}
