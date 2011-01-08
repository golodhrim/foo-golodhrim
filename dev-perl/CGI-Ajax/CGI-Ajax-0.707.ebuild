# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit perl-module

DESCRIPTION="The Perl CGI::Ajax Module"
SRC_URI="mirror://cpan/authors/id/B/BP/BPEDERSE/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/~bpederse/"

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
IUSE=""

DEPEND="dev-perl/Class-Accessor
	dev-lang/perl"
