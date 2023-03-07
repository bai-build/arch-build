#! /bin/sh

AUR_NAME=navidrome-git
EXECUTABLE_NAME=navidrome
DESCRIPTION="Music Server and Streamer compatible with Subsonic/Airsonic"
URL=https://www.navidrome.org/
LICENSE='GPL3'
ADDITIONAL=

pkgrel=1
if [[ $# == 1 ]]; then
    pkgrel=$1
fi

printf '' > PKGBUILD
echo "# Maintainer: lostpolaris <me [at] lostpolaris [dot] com>

pkgbase='${AUR_NAME}'
pkgname=(${AUR_NAME})
pkgver='v0.14.2.8.g803a577'
pkgrel=$pkgrel
pkgdesc='${DESCRIPTION}'
url='${URL}'
license=('${LICENSE}')
arch=(x86_64 armv6h armv7h aarch64)
provides=('${EXECUTABLE_NAME}')
conflicts=('${EXECUTABLE_NAME}' '${EXECUTABLE_NAME}-systemd')
backup=('var/lib/${EXECUTABLE_NAME}/${EXECUTABLE_NAME}.toml')
makedepends=('go' 'git' 'npm' 'taglib' 'nodejs-lts-fermium')
depends=('ffmpeg')
source=('${AUR_NAME}::git+https://github.com/deluan/navidrome.git'
        'navidrome.service'
        'navidrome.toml'
       )
sha256sums=('SKIP')

pkgver() {
    cd \"\${srcdir}/\${pkgname}\"

    git describe --long --tags | sed 's/\\([^-]*-g\\)/r\\1/;s/-/./g'
}

build() {
    cd \"\${srcdir}/\${pkgname}\"

    make setup
    make buildall
}

package() {
  install -d -o navidrome -g navidrome \"\${pkgdir}/usr/bin/${EXECUTABLE_NAME}\"
  install -d -o navidrome -g navidrome \"\${pkgdir}/var/lib/${EXECUTABLE_NAME}\"
  install -Dm 755 \"\${srcdir}/\${pkgname}/navidrome\" \"\$pkgdir/usr/bin/${EXECUTABLE_NAME}\"
  install -Dm 644 \"\${srcdir}/navidrome.service\" -t \"\${pkgdir}/usr/lib/systemd/system\"
  install -Dm 644 \"\${srcdir}/navidrome.toml\" -t \"\${pkgdir}/var/lib/${EXECUTABLE_NAME}\"
}
" >> PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Test
makepkg -f
