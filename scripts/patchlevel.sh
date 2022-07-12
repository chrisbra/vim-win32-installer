#!/bin/sh

sed -i "
:a
\$!{N;ba}
s/#.*/#define VIM_VERSION_PATCHLEVEL $PATCHLEVEL\n&/" ./version.h
