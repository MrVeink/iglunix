pkgname=limine
pkgver=3.4.4
mkdeps="nasm:llvm"
auto_cross

fetch() {
	curl -L "https://github.com/limine-bootloader/limine/releases/download/v$pkgver/limine-$pkgver.tar.xz" -o $pkgname-$pkgver.tar.xz
	tar -xf $pkgname-$pkgver.tar.xz
}

build() {
	cd $pkgname-$pkgver
	export LIMINE_CC=clang
	bad --gmake ./configure \
		--build=$HOST_TRIPLE \
		--host=$TRIPLE \
		--prefix=/usr
	bad --gmake gmake
}

package() {
	cd $pkgname-$pkgver
	bad --gmake gmake install DESTDIR=$pkgdir
}

license() {
	cd $pkgname-$pkgver
	cat LICENSE.md
}

backup() {
	return
}
