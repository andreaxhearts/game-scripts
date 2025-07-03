#!/bin/bash
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
