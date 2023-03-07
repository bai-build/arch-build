# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skycoin
_pkgname=${pkgname}
_githuborg=${_pkgname}
pkgdesc="Skycoin Cryptocurrency Wallet. skycoin.com"
pkgver=0.27.1
_pkgver=${pkgver}
pkgrel=2
_pkgrel=${pkgrel}
arch=('x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm')
_pkgarch=$(dpkg --print-architecture)
_pkggopath="github.com/${_githuborg}/${_pkgname}"
url="https://${_pkggopath}"
makedepends=('go' 'musl' 'kernel-headers-musl')
source=("${url}/archive/v${pkgver}.tar.gz"
"${_pkgname}-scripts.tar.gz"
) #"PKGBUILD.sig")
sha256sums=('4ede6a23e62bf50f097a647519b5b714a5581065bf71c9778e0965a7c84b112b'
            '5e147befaf68e30efa7a15e8b292e52cacb94846de4ac03158275a357c8b7dbc')

#tar -czvf skycoin-scripts.tar.gz skycoin-scripts
#updpkgsums

	prepare() {
		#verify PKGBUILD signature
		#gpg --verify ${srcdir}/PKGBUILD.sig ../PKGBUILD
		mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin
		ln -rTsf ${srcdir}/${_pkgname}-${pkgver} ${srcdir}/go/src/${_pkggopath}
	}

build() {
	export GOPATH=${srcdir}/go
	export GOBIN=${GOPATH}/bin
  export CC=musl-gcc
  export CGO_ENABLED=1
	_cmddir=${srcdir}/go/src/${_pkggopath}/cmd

  _buildbins address_gen
  _buildbins cipher-testdata
  _buildbins monitor-peers
  _buildbins newcoin
  _buildbins skycoin
  _buildbins skycoin-cli
	#binary transparency
	cd $GOBIN
	_msg2 'binary sha256sums'
	sha256sum $(ls)

  ### CONTROL FILES CREATION ###
  #create control file for the debian package
  echo "Package: ${_pkgname}" > ${srcdir}/control
  echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/control
  echo "Priority: optional" >> ${srcdir}/control
  echo "Section: web" >> ${srcdir}/control
  echo "Architecture: ${_pkgarch}" >> ${srcdir}/control
  echo "Depends: ${_debdeps}" >> ${srcdir}/control
  echo "Maintainer: Moses Narrow" >> ${srcdir}/control
  echo "Description: ${pkgdesc}" >> ${srcdir}/control
}

_buildbins() {

_binname=$1
_msg2 "building ${_binname} binary"
#SPEED UP TESTING OF BUILDS
if [[ ! -f ${GOBIN}/${_binname} ]] ; then
	cd ${_cmddir}/${_binname}
  go build -trimpath --ldflags '-linkmode external -extldflags "-static" -buildid=' -o $GOBIN/ .
fi
}

package() {
  _debpkgdir="${_pkgname}-${pkgver}-${_pkgrel}-${_pkgarch}"
  echo "${_debpkgdir}"
  _pkgdir="${pkgdir}/${_debpkgdir}"
  mkdir -p ${_pkgdir}/
	#create directory trees
	_skysrcdir=${srcdir}/${_pkgname}
	_skypath=${_pkgdir}/opt/${_pkgname}
	_skygobin=${_skypath}/bin
	_skyguidir=${_skypath}/src/gui
	mkdir -p ${_pkgdir}/usr/bin
	mkdir -p ${_skygobin}
	mkdir -p ${_skyguidir}
	#install binaries & symlink to /usr/bin
	_msg2 'installing binaries'
	_skybin="${srcdir}"/go/bin
	#avoid generic names for binaries
	#collect the binaries & install
	_skybins=$( ls "$_skybin")
	for i in $_skybins; do
		install -Dm755 ${srcdir}/go/bin/${i} ${_skygobin}/${i}
		ln -rTsf ${_skygobin}/$i ${_pkgdir}/usr/bin/${i}
		chmod 755 ${_pkgdir}/usr/bin/${i}
	done
  _msg2 'installing gui sources'
	#install the web dir (UI)
	cp -r ${_skysrcdir}/src/gui/static ${_skyguidir}
  _msg2 'installing scripts'
	#install the scripts
	_skycoinscripts=$( ls --ignore=*.service ${srcdir}/${_pkgname}-scripts/ )
	for i in $_skycoinscripts; do
		install -Dm755 ${srcdir}/${_pkgname}-scripts/${i} ${_skygobin}/${i}
		ln -rTsf ${_skygobin}/${i} ${_pkgdir}/usr/bin/${i}
		chmod 755 ${_pkgdir}/usr/bin/${i}
	done
  _msg2 'installing systemd services'
  #install the system.d service
    install -Dm644 ${srcdir}/${_pkgname}-scripts/skycoin-node.service ${_pkgdir}/usr/lib/systemd/system/skycoin-node.service
  _msg2 'correcting symlink names'
	#correct symlink names
	cd ${_pkgdir}/usr/bin/
	_namechange=$(ls --ignore='skycoin*')
	for i in $_namechange; do
		mv ${_pkgdir}/usr/bin/${i} ${_pkgdir}/usr/bin/${_pkgname}-${i}
	done

  _msg2 'installing control file'
  install -Dm755 ${srcdir}/control ${_pkgdir}/DEBIAN/control

  _msg2 'creating the debian package'
  #create the debian package
  cd $pkgdir
  dpkg-deb --build -z9 ${_debpkgdir}
  mv *.deb ../../
  #exit so the arch package doesn't get built
  exit
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
