# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
EGIT_REPO_URI="git://github.com/nonstop/termit.git"
inherit cmake-utils git

DESCRIPTION="TermIt -- a Terminal vased on vte library and extensible via Lua"
HOMEPAGE="http://wiki.github.com/nonstop/termit"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-util/cmake-2.6.4-r3"
RDEPEND="${DEPEND}
	x11-libs/vte
	dev-lang/lua
	>=x11-libs/gtk+-2.10"

DOCS="README ChangeLog session.example termit.example"

CMAKE_IN_SOURCE_BUILD="yes"

pkg_postinst() {
	einfo
	einfo "There is an example of configuration file in"
	einfo "         /usr/share/doc/termit/termit.example"
	einfo
}
