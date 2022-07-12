#!/bin/sh

sed -i "
:a
\$!{N;ba}
s/#define VIM_VERSION_PATCHLEVEL_STR.*/#define VIM_VERSION_PATCHLEVEL_STR \"$PATCHLEVEL\"\n/" ./version.h
