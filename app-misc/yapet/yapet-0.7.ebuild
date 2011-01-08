# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit base

DESCRIPTION="A curses (text) based password encryption tool"
HOMEPAGE="http://www.guengel.ch/myapps/yapet/"
SRC_URI="${HOMEPAGE}downloads/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="nls"

RDEPEND="nls? ( sys-devel/gettext )
	sys-libs/ncurses
	dev-libs/openssl"
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/yapet_0.7_patch_bug_46.patch" )

src_configure() {
	econf --enable-terminal-title \
		--enable-csv2yapet \
		--disable-source-doc \
		--disable-build-doc \
		$(use_enable nls)
}
