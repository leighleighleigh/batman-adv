#!/usr/bin/env bash

DF="$(realpath ./default.nix)"
rm -rf ~/tmpdev
mkdir -p ~/tmpdev/build && cd ~/tmpdev/build
export out=~/tmpdev/build/out
echo $out
nix-shell -E "with import <nixos> {}; pkgs.linuxPackages_latest.callPackage $DF {}" --command "echo HELLO THERE; export out=~/tmpdev/build/out; return"

exit 0

HEADERS=$(nix-build -E '(import <nixos> {}).linuxPackages_latest.kernel.dev' --no-out-link)
export KERNELPATH=$HEADERS/lib/modules/*/build
echo $KERNELPATH

CMD=$(cat <<EOF
set -x
make -C $KERNELPATH M=$(pwd) modules
set +x

return
EOF
)

nix-shell '<nixos>' -A linuxPackages_latest.kernel.dev --command "$CMD"

exit 0

TMP=$(realpath ../)
make -C $(nix-build -E '(import <nixos> {}).linuxPackages_latest.kernel.dev' --no-out-link)/lib/modules/*/build M="${TMP}" modules
