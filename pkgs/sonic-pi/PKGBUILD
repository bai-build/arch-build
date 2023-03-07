# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=sonic-pi
pkgver=3.1.0
pkgrel=2
pkgdesc="A music-centric programming environment, originally built for the raspberry pi."
arch=('i686' 'x86_64')
url="http://sonic-pi.net/"
license=('MIT')
depends=('lua' 'ruby' 'qscintilla-qt5' 'jack' 'supercollider' 'sc3-plugins' 'qwt' 'boost' 'erlang-nox' 'aubio' 'libffi' 'http-parser')
makedepends=('cmake' 'qt5-tools' 'sed')
optdepends=('qjackctl: for graphical jackd spawning/configuration'
            'jack2: better jackd if you want to use without gui')
source=("https://github.com/samaaron/${pkgname}/archive/v${pkgver}.tar.gz"
        "osmid::git+https://github.com/llloret/osmid.git"
        "${pkgname}.png" "${pkgname}.desktop" "${pkgname}")
sha256sums=('08de9d4ed3c81bbe69061d50c79c6bed48a8d3212e11fec6c3ef2197423f466b'
            'SKIP'
            '3f5c67ad2478003de9962cf7d7054f19ce4a420168cd838b8f513b9ed96a1d00'
            'c85abbf8a386ec56a2c0ffcb54d4c0ab0235574965ded3097053f1b3f602dd34'
            '69ed1892a41bbbb487fe3c13f8c5a2f0e65adfc66d75f45c9a4d2d8d750c88d4')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's/lqt5scintilla2/lqscintilla2_qt5/g' "app/gui/qt/SonicPi.pro"
    rm -fr app/server/native
}

build() {
    cd "${srcdir}/osmid"
    mkdir build
    cd build
    cmake ..
    make all

    cd "${srcdir}/${pkgname}-${pkgver}/app/server/erlang"
    erlc osc.erl pi_server.erl

    cd "${srcdir}/${pkgname}-${pkgver}/app/gui/qt"
    ../../server/ruby/bin/compile-extensions.rb
    ../../server/ruby/bin/i18n-tool.rb -t
    cp -f ruby_help.tmpl ruby_help.h
    ../../server/ruby/bin/qt-doc.rb -o ruby_help.h
    lrelease SonicPi.pro 
    qmake-qt5 SonicPi.pro 
    make
    find ../.. -type f -name "*.o" -delete
}

package() {
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt"
    mv "${pkgdir}/opt/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"

    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin"

    install -d "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps"

    install -d "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"

    cd "${srcdir}/${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"

    install -d "${pkgdir}/opt/${pkgname}/app/server/native/osmid"
    install -Dm755 "${srcdir}/osmid/build/m2o" "${pkgdir}/opt/${pkgname}/app/server/native/osmid"
    install -Dm755 "${srcdir}/osmid/build/o2m" "${pkgdir}/opt/${pkgname}/app/server/native/osmid"
}
