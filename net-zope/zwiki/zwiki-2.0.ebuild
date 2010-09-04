# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-zope/zwiki/zwiki-0.48.ebuild,v 1.2 2006/01/27 02:54:22 vapier Exp $

inherit zproduct

MY_P="ZWiki-2.0b1"

DESCRIPTION="A zope wiki-clone for easy-to-edit collaborative websites"
HOMEPAGE="http://zwiki.org"
SRC_URI="${HOMEPAGE}/releases/${MY_P}.tgz"

LICENSE="GPL-2"
KEYWORDS="~ppc ~sparc ~x86 ~amd64"

ZPROD_LIST="ZWiki"
MYDOC="CHANGES.txt README.txt ${MYDOC}"
