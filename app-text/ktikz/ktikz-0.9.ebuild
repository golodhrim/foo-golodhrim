# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Editor for TiKZ pictures"
HOMEPAGE="http://hackenberger.at/ktikz"
SRC_URI="http://www.hackenberger.at/ktikz/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	x11-libs/qt-core
	app-text/poppler"
RDEPEND=""

src_compile() {
	cp ${FILESDIR}/conf.pri ${S}/.
	qmake
	make
}

src_install() {
	#mkdir -p ${D}/usr/share/ktikz
	#mkdir -p ${D}/var/lib
	#mkdir -p ${D}/usr/share/info
	#mkdir -p ${D}/usr/share/man
	#mkdir -p ${D}/etc
	#mkdir -p ${D}/usr/share/bin
	#einstall
	emake install DESTDIR="${D}"
}
