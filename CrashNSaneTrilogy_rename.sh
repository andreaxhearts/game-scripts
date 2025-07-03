#!/bin/bash

# Rename files extracted from .pak archives.

# Works with:
#  - Crash Bandicoot N. Sane Trilogy
#  - Crash Team Racing Nitro-Fueled
#  - (possibily other Vicarious Visions games)
#    (or other 'Alchemy' engine games?)
#
# (you can use QuickBMS to extract .pak files)
#  https://aluigi.altervista.org/quickbms.htm
#
# After the script removes the backtick character from filenames,
# you use other command line utilities, e.g. ImageMagick.

# Usage:
#   CrashNSaneTrilogy_rename.sh [options]
#   options:
#    -r : Revert renamed files back.

shopt -s nocasematch
while test $# -gt 0
do
    case "$1" in
        -r) revertFN=true
            ;;
        --reset) revertFN=true
            ;;
        --revert) revertFN=true
            ;;
        *) revertFN=false
            ;;
    esac
    shift
done

if [ "$revertFN" = true ]; then
	for f in *.png; do
		[ $(echo "$f" | sed 's/\./`/') ] && \
			mv "$f" "$(echo "$f" | sed 's/\./`/')"
	done
else
	for f in *.igz; do
		[ $(echo "$f" | sed -n 's/\(.*\)`\(.*\)/\1.\2/pI') ] && \
			mv "$f" "$(echo "$f" | sed -n 's/\(.*\)`\(.*\)/\1.\2/pI')"
	done
fi
