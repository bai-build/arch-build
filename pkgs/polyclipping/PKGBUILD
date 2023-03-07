
pkgname=polyclipping
pkgver=6.4.2
pkgrel=1
pkgdesc="Polygon clipping library (also known as clipper)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/polyclipping/"
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/polyclipping/clipper_ver${pkgver}.zip")
sha256sums=('a14320d82194807c4480ce59c98aa71cd4175a5156645c4e2b3edd330b930627')

build() {
  cd "$srcdir"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../cpp
  make
}

package() {
  cd "$srcdir/build"
  make install DESTDIR="$pkgdir"
}
