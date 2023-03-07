# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=asp
pkgver=1
pkgrel=2
pkgdesc='Arch Linux build source file management'
arch=('any')
url=https://github.com/falconindy/asp
license=('MIT')
depends=('awk' 'bash' 'jq')
makedepends=('asciidoc')
source=("asp-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e984a319222f48cb799c79adb19c458bd4628cbf4a4963b1556b14ce84e65a4831cdeadec1eda9c8adada53dab07ec4dd2328f8fe08958ba785b91b6bf356536')

build() {
  make -C asp-$pkgver
}

package() {
  make -C asp-$pkgver PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 asp-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/asp/LICENSE
}

# vim:set ts=2 sw=2 et:
