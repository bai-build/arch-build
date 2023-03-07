# Maintainer: Xentec <xentec at aix0 dot eu>

pkgname=entityx
pkgver=1.2.0
pkgrel=3
pkgdesc="A fast, type-safe C++ Entity-Component system"
arch=('i686' 'x86_64')
url="https://github.com/alecthomas/entityx"
license=('MIT')

depends=('gcc-libs')
makedepends=('cmake')
conflicts=('entityx-git')

source=("https://github.com/alecthomas/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('44718fee6b8919e4c5bfe0314397af2283aed0788f752a566cb2c7e55c56d026')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build && cd build

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DENTITYX_BUILD_SHARED=1 \
		-DENTITYX_BUILD_TESTING=0 \
		-Wno-dev \
		..

	make
}

check() {
	cd "$pkgname-$pkgver"
	cd build

	cmake \
		-DENTITYX_BUILD_TESTING=1 \
		..

	make 
	make test
}

package() {
	cd "$pkgname-$pkgver"

	install -D -m644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "cmake/FindEntityX.cmake" "${pkgdir}/usr/share/cmake-3.3/Modules/FindEntityX.cmake"

	cd build
	DESTDIR="$pkgdir" make install
}
