#!/usr/bin/env bash

SCRIPT=$(cat <<EOF
let
    pkgs = import <nixpkgs> {};
in {
    batman_adv = pkgs.linuxPackages.callPackage ./default.nix {};
}
EOF
)

#nix-build --expr 'let pkgs = import <nixpkgs> {}; in { batman_adv = pkgs.callPackage ./default.nix {}; }'
nix-build --expr "$SCRIPT"
