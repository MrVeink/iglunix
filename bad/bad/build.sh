pkgname=bad
pkgver=main

fetch() {
	curl -L "https://github.com/iglunix/bad/archive/refs/heads/main.tar.gz" -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
}

build() {
	cd $pkgname-$pkgver
	[ -z "$WITH_CROSS" ] || export CFLAGS="$CFLAGS --target=$TRIPLE --sysroot=$WITH_CROSS_DIR"
	make
}

package() {
	cd $pkgname-$pkgver
	make install DESTDIR=$pkgdir PREFIX=/usr
}

license() {
	cd $pkgname-$pkgver
	cat LICENSE
#	cat COPYING
}

backup() {
	return
}
