# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="GTimer is a timer and report generator for your activities, built using the GTK+ toolkit."
HOMEPAGE="http://www.k5n.us/gtimer.php"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="=x11-libs/gtk+-2*"

src_compile() {

	./configure \
	--prefix=/usr \
	|| die "Configure failed"

	 #Fix null segmentation fault
	sed -s -i 's/GError \*err;/GError \*err = NULL;/' main.c

	# if someone find better...
	#sed -s -i 's/GTK_VERSION/10212/' *.c

	emake || die "emake failed"
}

src_install() {
	make prefix=${D}/usr install || die "make install failed"

	dodoc README AUTHORS NEWS COPYING ChangeLog
}
