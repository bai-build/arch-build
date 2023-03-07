pkgname=gnupg-pkcs11-scd
pkgver=0.9.2
pkgrel=1
pkgdesc="A smart-card daemon to enable the use of PKCS11 tokens with GnuPG."
url="http://gnupg-pkcs11.sourceforge.net"
license=("BSD")
depends=(pkcs11-helper libgpg-error libassuan libgcrypt openssl)
arch=('arm' 'i686' 'x86_64')
md5sums=('b0eaecbbe1641b45cfcc34edc3f0c6fd')
source=(https://github.com/alonbl/gnupg-pkcs11-scd/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2)

build() {
    cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
