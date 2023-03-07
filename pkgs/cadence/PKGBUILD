# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: falkTX <falktx at gmail dot com>

pkgname=cadence
pkgver=0.8.1
pkgrel=4
pkgdesc="JACK toolbox for audio production."
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/cadence"
license=('GPL2')
depends=('python-dbus' 'python-pyqt4' 'jack' 'qt4')
makedepends=('a2jmidid' 'jack_capture' 'ladish' 'pulseaudio-jack' 'python-rdflib' 'zita-ajbridge')
optdepends=(
  'a2jmidid: ALSA to JACK MIDI bridge'
  'jack_capture: recording via Cadence-Render'
  'ladish: session management via Claudia'
  'pulseaudio-jack: PulseAudio to JACK bridge'
  'python-rdflib: LADSPA-RDF support in Carla'
  'zita-ajbridge: ALSA to JACK bridge'
)
source=("https://downloads.sourceforge.net/project/kxstudio/Releases/${pkgname}/Cadence-${pkgver}-src.tar.bz2")
sha512sums=('333a8532859cfa4ca61446b6b136baa7930d2a9d1acbb55e2ee296998604c0e8e3effd5e21fe3154caf8ae6534190a0f592b070b671164ccfd647567ba2cc33f')

build() {
  cd "Cadence-${pkgver}"
  make
}

package() {
  cd "Cadence-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
