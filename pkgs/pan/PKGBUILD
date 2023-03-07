# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.140
pkgrel=1
pkgdesc="A powerful Newsgroup Article reader"
arch=('i686' 'x86_64')
url="http://pan.rebelbase.com/"
license=('GPL2')
depends=('gtk2' 'gmime' 'gtkspell' 'gnutls')
#depends=('gtk3' 'gmime' 'gnutls')
makedepends=('gnome-common' 'intltool')
conflicts=('pan-git')
options=('!makeflags')
source=("http://pan.rebelbase.com/download/releases/${pkgver}/source/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ba1c65ee75b9eca1f15f6249ea762492309731446edc8b09085b63ad34351c71')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  #./configure --prefix=/usr --with-gtk3 --without-gtkspell --with-gnutls
  #CXXFLAGS="-D_GLIBCXX_USE_CXX11_ABI=0" ./configure --prefix=/usr --disable-gkr --without-dbus --with-gnutls
  ./configure --prefix=/usr --disable-gkr --without-dbus --with-gnutls
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
