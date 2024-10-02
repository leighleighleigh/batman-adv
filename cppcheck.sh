#!/usr/bin/env bash

HEADERS='/nix/store/d4hzyrkkp1lqy8z30k10q6za7y4gxy5i-linux-6.11-dev/lib/modules/6.11.0/source/include/'
#rm -rf .cppcheck
#mkdir -p .cppcheck

#cppcheck -I $HEADERS -DCONFIG_BATMAN_ADV=m \

cppcheck --check-level=exhaustive --force --enable=all --disable=missingInclude \
-DCONFIG_BATMAN_ADV_DEBUG=n \
-DCONFIG_BATMAN_ADV_BLA=y \
-DCONFIG_BATMAN_ADV_DAT=y \
-DCONFIG_BATMAN_ADV_NC=n \
-DCONFIG_BATMAN_ADV_MCAST=y \
-DCONFIG_BATMAN_ADV_TRACING=n \
-DCONFIG_BATMAN_ADV_BATMAN_V=y .

#cppcheck --cppcheck-build-dir=.cppcheck -I $HEADERS --enable=unusedFunction  "$@" .
