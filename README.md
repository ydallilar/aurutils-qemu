
**aurutils-qemu**

This is an experimental project me figuring out how to compile AUR packages on x86_64 machine for my poor Raspberry Pi (easy way!). It is a combination of extensions for `devtools` of ArchLinux and [aurutils]{https://github.com/AladW/aurutils}. Introduces three additional commands for `aurutils`:

	aur build-qemu
	aur sync-qemu
	aur chroot-qemu

and for `devtools`:

	mkarchroot-qemu
	makechrootpkg-qemu
	arch-nspawn-qemu

These are very similar to existing non Qemu versions with a few tweaks:

- The biggest issue for me was to figure out why `devtools` complains about the architecture even though I am emulating the chroot with Qemu. Simply, there is an `-s` flag in `arch-nspawn` which disables architecture checking. The majority of the patch is to handle that issues.
- Issues with the package cache. By default, these tools stores the downloaded packages in `/var/cache/pacman/pkg`. `any` packages are problematic to store in the same place. I assume the versions may be different for provided in Archlinux and ArchlinuxARM repositories. By default, `*-qemu` tools store the packages in `/var/cache/pacman/pkg-arm` instead (and no option to change it for now). 

**Procedure (as far as I can remember the relevant parts):**

1. Install `binfmt-qemu-static` and `qemu-user-static` packages from AUR. `mkarchroot-qemu` puts `qemu-arm-static` to the root of the chroot directory.
2. Grab `pacman.conf` and `makepkg.conf` from your ArchLinuxARM installation. The procedure detects the relevant architecture from the supplied `pacman.conf`. I am providing `pacman_armv6.conf` and `makepkg_armv6.conf` as an example. 
3. (Optional to create a chroot for scratch) Grab and install `archlinuxarm-keyring` to your host. During `mkarchroot` process, `pacman` checks the keys in your host so it will fail if you don't.  
4. (Optional to use an existing chroot) You can also use your manual chroot for the process. Make sure you put in somewhere like `$CHROOT/root`. Put `qemu-arm-static` in the directory in its root directory and do a one time chroot using `arch-nspawn-qemu`. 
5. Follow the instructions from [aurutils]{https://github.com/AladW/aurutils} on how to create your own local repository. The repository must be defined in your custom `pacman_$arch.conf` instead of `/etc/pacman.conf`!.

And we are good to go:

	aur build-qemu -c -D $CHROOT -C $PACMAN_CONF -M $MAKEPKG_CONF -d $ARMV6_REPO
	aur sync-qemu -c -D $CHROOT -C $PACMAN_CONF -M $MAKEPKG_CONF -d $ARMV6_REPO $AUR_PACKAGE

