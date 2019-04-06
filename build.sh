#!/bin/bash

AUR_PATH=/usr/lib/aurutils

mkdir -p aurutils
mkdir -p devtools

add_qemu(){
	
	FIN=$1; shift
	TYPE=$1; shift
	declare -a sed_string

	for val in $@; do
		sed_string+="/^#/!s/${val} /${val}-qemu /g; " 
	done

	sed_string=${sed_string::-2}

	case $TYPE in
		aurutils)  sed -r "$sed_string" $AUR_PATH/$FIN > aurutils/$FIN-qemu;;
		devtools)  sed -r "$sed_string" /usr/bin/$FIN > devtools/$FIN-qemu;;
	esac
}

add_qemu aur-chroot aurutils arch-nspawn makechrootpkg
add_qemu aur-build aurutils chroot
add_qemu aur-sync aurutils build

add_qemu makechrootpkg devtools arch-nspawn




