# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
pkgname=hashdeep
pkgver=4.4
pkgrel=3
pkgdesc="cross-platform tools to computer hashes, or message digests, for any number of files"
arch=('i686' 'x86_64')
url="https://github.com/jessek/hashdeep"
license=('GPL' 'custom')
depends=("gcc-libs")
makedepends=()
source=(https://github.com/jessek/hashdeep/archive/v${pkgver}.tar.gz)
md5sums=('3b6a475c5bc2d6ce8954ce90a62008ef')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./bootstrap.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# EOF
