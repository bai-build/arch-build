# Maintainer: piernov <piernov@piernov.org>

pkgname=pc-ble-driver
pkgver=4.1.4
pkgrel=1
pkgdesc="C/C++ libraries for Bluetooth Low Energy nRF5 SoftDevice serialization."
arch=('x86_64')
url="https://github.com/NordicSemiconductor/pc-ble-driver"
license=('custom')
depends=('spdlog')
makedepends=('cmake' 'asio' 'catch2')
options=('staticlibs')
source=("https://github.com/NordicSemiconductor/pc-ble-driver/archive/v${pkgver}.tar.gz"
	"https://github.com/NordicSemiconductor/pc-ble-driver/pull/272.patch")
md5sums=('70b45aef652ca4423f581efc14a3d077'
         '4fc0fa05053c066267da4feeb356b24e')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < "$srcdir"/272.patch # https://github.com/NordicSemiconductor/pc-ble-driver/pull/272
	mkdir -p build
	cd build
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-G Ninja ..
	cmake --build .
}

package() {
	cd "$pkgname-$pkgver/build"
	DESTDIR="$pkgdir" ninja install
}
