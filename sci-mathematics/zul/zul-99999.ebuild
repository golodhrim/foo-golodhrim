# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MYP=zul-${PV}

DESCRIPTION="Constructions with Compass and Ruler"
HOMEPAGE="http://zirkel.sourceforge.net/"
SRC_URI="http://zirkel.sourceforge.net/zirkel.jar
http://zirkel.sourceforge.net/doc_de/images/Zirkel.png"

LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="virtual/jre"
RDEPEND="${DEPEND}"

S="${WORKDIR}/../distdir"

src_install () {
	mkdir -p ${D}/usr/share/${MYP}/lib
	mkdir -p ${D}/usr/bin
	mkdir -p ${D}/usr/share/pixmaps
	mkdir -p ${D}/usr/share/applications
	cp ${S}/zirkel.jar ${D}/usr/share/${MYP}/lib/
	echo -e "#!/bin/sh\n\njava -jar /usr/share/${MYP}/lib/zirkel.jar" >> ${D}/usr/bin/zirkel
	chmod 755 ${D}/usr/share/${MYP}/lib/zirkel.jar
	chmod 755 ${D}/usr/bin/zirkel
	cp ${S}/Zirkel.png ${D}/usr/share/pixmaps/zul.png
	make_desktop_entry zirkel Z.u.L. zul.png sci
}
