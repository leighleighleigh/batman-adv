#!/usr/bin/env nix-shell
#!nix-shell -p cppcheck -i bash
HEADERS='/nix/store/d4hzyrkkp1lqy8z30k10q6za7y4gxy5i-linux-6.11-dev/lib/modules/6.11.0/source/include/'
#rm -rf .cppcheck
mkdir -p .cppcheck
cppcheck --cppcheck-build-dir=.cppcheck -I $HEADERS --enable=unusedFunction  "$@" .
