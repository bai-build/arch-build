# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>

pkgname=wake
pkgver=0.18.1
pkgrel=1
pkgdesc="The SiFive wake build tool"
arch=('x86_64')
url="https://github.com/sifive/wake"
license=('custom')
depends=('dash' 'sqlite' 'gmp' 'fuse-common' 're2' 'ncurses5-compat-libs')
optdepends=('re2c'
            'utf8proc')
source=("https://github.com/sifive/wake/releases/download/v$pkgver/wake_$pkgver.tar.xz")
md5sums=('b29aef78333b5cb010f938fe6cac67ff')

prepare() {
  cd $srcdir/$pkgname-$pkgver
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  ./bin/wake 'install "'$pkgdir'/usr"'
  mkdir -p $pkgdir/usr/share/licenses/wake
  install -Dm644 $srcdir/$pkgname-$pkgver/LICENSE* $pkgdir/usr/share/licenses/wake
}
