# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Emil Vanherp <emil dot vanherp at hotmail dot com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Xavier D. <magicrhesus at ouranos dot be>
# Contributor: Valere Monseur <valere dot monseur at ymail dot com>

pkgname=eid-mw
pkgver=5.0.14
pkgrel=1

pkgdesc='The middleware, viewer and Firefox extension for the Belgian electronic identity card (Belgian eID)'
arch=('i686' 'x86_64')
url='http://eid.belgium.be/'
license=('LGPL3')

depends=('gtk3' 'libproxy' 'curl')
optdepends=(
    'firefox: Extension for Belgian eid'
    'acsccid: ACS CCID smart card readers'
    'ccid: A generic USB Chip/Smart Card Interface Devices driver (needed for Belgian Digipass 870)'
    'pcsc-tools: PC/SC smartcard tools')
makedepends=('pcsclite')
conflicts=('eid-viewer')
replaces=('eid-viewer')

# Upstream has decided not signing sources using the GPG key as this was
# confusing users who are not used to use .asc signature files.  So while the
# binaries proposed on the following page
# https://eid.belgium.be/en/using_your_eid/installing_the_eid_software/linux
# are signed, the sources are not. It is asked to security-conscious users
# using the dist server instead.
#
# On Wed, Mar 29, 2017 at 11:08:34AM +0200, William Gathoye wrote:
# > On 03/29/2017 10:54 AM, Wouter Verhelst wrote:
# >> It is not meant for the security-conscious. If you want to be 100%
# >> certain, then https://dist.eid.belgium.be/continuous/sources/ is signed
# >> by a GPG key.
# >
# > Ok. I'm gonna switch to that channel again then (for Arch).
#
# Good, I was hoping you'd say that 
#
# > But then why do you have specified on the eid.belgium.be page that the
# > binaries could be checked using the GPG key
# > B37D9040098C3DEEE00F6D08A35743EA6773D225 as we cannot check it as the
# > .asc file is not present.?
#
# The precompiled binaries in the repositories that can be found on
# files.eid.belgium.be (and for which the "eid-archive" packages on that page add
# configuration to supported distributions) *are* signed with that key. The
# sources aren't, for reasons as explained above.
#
# >> Yes, I know, I set that up (by request of the then-current arch
# >> maintainer, as it happens)
# >
# > Yes, indeed. wget is me. I'm AM the Arch Linux. Thanks for taking this up 
#
# I know, but it was your predecessor ("Alad") who asked for that, and by
# whose request I set that up.
#
# [...]
source=(
    "https://dist.eid.belgium.be/continuous/sources/${pkgname}-${pkgver}-v${pkgver}.tar.gz"{,.asc}
)
sha512sums=(
    'c41453c4d28a81342c71dedf1931adc74957617ff620e82b52a4d4515852293b794a51374ea9ac1398a7cd613649c007204cff3512a05b6511f6625a8b65652b'
    'd15e5725b266bc15dd51ca696deec4b7ba0de658e46fbae4907c949467ebbfbb6466ec897c85dc3921840bc6c47652d398109fa0ccf70a1cdea2c21dd60665fa'
)

validpgpkeys=(
    # Belgian eID Automatic Signing Key (continuous builds)
    # If you trust it, you can import it with
    # gpg --recv-keys D95426E309C0492990D8E8E2824A5E0010A04D46
    # Receiving GPG keys might fail with the following error message:
    # gpg: keyserver receive failed: Connection refused
    # If this happens, just check your DNS or use another one.
    D95426E309C0492990D8E8E2824A5E0010A04D46
)

build() {
    cd "${pkgname}-${pkgver}-v${pkgver}"
    sed -i "s%c_rehash%openssl rehash%g" plugins_tools/eid-viewer/Makefile.in
    ./configure --prefix=/usr --libexecdir=/usr/bin
    make
}

package() {
    cd "${pkgname}-${pkgver}-v${pkgver}"
    make install DESTDIR="${pkgdir}"
}
