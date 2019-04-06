# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>

_package=aurutils-qemu
pkgname=${_package}-git
pkgver=3.05e9ce3
pkgrel=1
pkgdesc="..."
arch=('any')
url="https://github.com/librespot-org/librespot"
depends=('aurutils')
makedepends=('git')
source=('git+https://github.com/pssncp142/aurutils-qemu.git')
sha256sums=('SKIP')

pkgver()
{
    cd ${_package}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build()
{
    cd ${_package}
	./build.sh
}

package()
{
	cd ${_package}
	install -D -m 755 aurutils/aur-build-qemu $pkgdir/usr/lib/aurutils/aur-build-qemu
	install -D -m 755 aurutils/aur-chroot-qemu $pkgdir/usr/lib/aurutils/aur-chroot-qemu
	install -D -m 755 aurutils/aur-sync-qemu $pkgdir/usr/lib/aurutils/aurutils

	install -D -m 755 devtools/mkarchroot-qemu $pkgdir/usr/bin/mkarchroot-qemu
	install -D -m 755 devtools/arch-nspawn-qemu $pkgdir/usr/bin/arch-nspawn-qemu
	install -D -m 755 devtools/makechrootpkg-qemu $pkgdir/usr/bin/makechrootpkg-qemu

	install -D -m 644 etc/pacman_armv6.conf $pkgdir/etc/pacman_armv6.conf
	install -D -m 644 etc/makepkg_armv6.conf $pkgdir/etc/makepkg_armv6.conf
}

