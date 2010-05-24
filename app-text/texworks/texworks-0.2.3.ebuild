# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Editor used by Pragma ADE for editing ConTeXt Files"
HOMEPAGE="http://tug.org/texworks/"
SRC_URI="http://texworks.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	x11-libs/qt-core
	app-text/poppler
	app-text/hunspell
	sys-apps/dbus"
#virtual/poppler-qt4
RDEPEND=""

src_compile() {
	qmake
	make
}

src_install() {
	mkdir -p ${D}/usr/bin/
	mkdir -p ${D}/opt
	cp -r ${S}/ ${D}/opt/
	ln -s ${D}/opt/${P}/texworks ${D}/usr/bin/texworks
}
