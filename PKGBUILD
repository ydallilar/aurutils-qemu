# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=aurutils-qemu
pkgver=523.3ce2211
pkgrel=1
pkgdesc="..."
arch=('any')
url="https://github.com/librespot-org/librespot"
depends=('aurutils')
source=('git+https://github.com/pssncp142/aurutils-qemu.git')
sha256sums=('SKIP')

pkgver()
{
    cd "$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build()
{
    cd "$pkgname"
	./build.sh
}

package()
{
	install -D -m 755 aurutils/aur-build-qemu $pkgdir/usr/lib/aurutils
	install -D -m 755 aurutils/aur-chroot-qemu $pkgdir/usr/lib/aurutils
	install -D -m 755 aurutils/aur-sync-qemu $pkgdir/usr/lib/aurutils

	install -D -m 755 devtools/mkarchroot-qemu $pkgdir/usr/bin
	install -D -m 755 devtools/arch-nspawn-qemu $pkgdir/usr/bin
	install -D -m 755 devtools/mkarchroot-qemu $pkgdir/usr/bin

	install -D -m 644 etc/pacman_armv6.conf $pkgdir/etc/
	install -D -m 644 etc/makepkg_armv6.conf $pkgdir/etc/
}

