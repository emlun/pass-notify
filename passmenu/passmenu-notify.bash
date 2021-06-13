#!/usr/bin/env bash

shopt -s nullglob globstar

PROGRAM="${0##*/}"

typeit=0
notify=0

opts="$(getopt -o "" -l notify,typeit -n "$PROGRAM" -- "$@")"
[[ $? -ne 0 ]] && (echo "Usage: $PROGRAM [--notify] [--typeit]" >&2 ; exit 1)
eval set -- "$opts"
while true; do case $1 in
	--notify) notify=1; shift ;;
	--typeit) typeit=1; shift ;;
	--) shift; break ;;
esac done

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

password=$(printf '%s\n' "${password_files[@]}" | dmenu -i "$@")

[[ -n $password ]] || exit

if [[ $typeit -eq 0 ]]; then
	if [[ $notify -ne 0 ]] && hash notify-send; then
		pass show-notify -c "$password" 2>/dev/null
	else
		pass show -c "$password" 2>/dev/null
	fi
else
	pass show "$password" |
		awk 'BEGIN{ORS=""} {print; exit}' |
		xdotool type --clearmodifiers --file -
fi
