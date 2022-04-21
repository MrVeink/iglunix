pkgname=limine
pkgver=3.4.1
mkdeps="nasm:llvm"

fetch() {
	curl -L "https://github.com/limine-bootloader/limine/releases/download/v$pkgver/limine-$pkgver.tar.xz" -o $pkgname-$pkgver.tar.xz
	tar -xf $pkgname-$pkgver.tar.xz
}

build() {
	cd $pkgname-$pkgver
	bad --gmake ./configure --prefix=/usr
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
