# Maintainer: Xiaodong Qi <qxd@bupt.edu.cn>
pkgname=yage
pkgver=0.1.0.20180305.1023.a832b96
pkgrel=1
epoch=0
pkgdesc="Yet another Graphics Engine"
arch=('i686' 'x86_64')
url="https://github.com/yet-another-graphics-engine/YaGE/"
license=('LGPL3')
groups=()
depends=('gtk3' 'gstreamer0.10')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_gitbuild='a832b962f70ce1eaa743d20a7cab75d487ca77d8'
source=("https://github.com/yet-another-graphics-engine/YaGE/archive/$_gitbuild.zip")
noextract=()
md5sums=('f8815b856fe3881793013ef0f08a0d80')

prepare() {
	return 0
}

build() {
	cd YaGE-$_gitbuild
	cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

check() {
	return 0
}

package() {
	cd YaGE-$_gitbuild
	make DESTDIR="$pkgdir/" install
}
