#!/usr/bin/env bash
mkdir -p ./build/
rm -f ./build/*.ko.xz
rm -f ./build/*.ko
cp ./result/lib/modules/*/updates/net/batman-adv/batman-adv.ko.xz ./build/
unxz ./build/*.ko.xz
