# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp

DESCRIPTION="SQL based, powerful small business accounting system"
SRC_URI="http://www.sql-ledger.com/source/${P}.tar.gz"
#http://www.sql-ledger.com/source/sql-ledger-2.8.11.tar.gz
HOMEPAGE="http://www.sql-ledger.com/"  
#The sources should be put in /usr/portage/distfiles
# This ebuild exists largely to allow Gentoo to pull in all 
# the needed dependencies. The rest of it is based on extracting
# the necessary steps from SQL-Ledger's setup.pl and README.

# THIS EBUILD IS NOT YET INTENDED TO UPGRADE AN EXISTING INSTALLATION
# SO DON'T TRY AND DO THAT!!!
#However that is the next step.

LICENSE="GPL"
KEYWORDS="x86 ~alpha ~amd64 ~hppa ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="${DEPEND}
	dev-perl/libwww-perl
	>=dev-lang/perl-5
	>=virtual/postgresql-server-8.0
	dev-perl/DBI
	dev-perl/DBD-Pg
	>=app-text/texlive-2009
	>=dev-texlive/texlive-latex-2009
	>=dev-texlive/texlive-latexrecommended-2009"
#	www-servers/apache excluded as any webserver would be ok...

S="${WORKDIR}/sql-ledger"

src_unpack() {
	unpack ${A}
}

src_compile() {
# do we want to do something with sql-ledger.conf.default?
	echo
}

src_install() {
	webapp_src_preinst

	# handle documentation files
	#
	# NOTE that doc files go into /usr/share/doc as normal; they do NOT
	# get installed per vhost!

	einfo "Installing docs"
	dodoc doc/*

	einfo "Copying main files"
	cp sql-ledger.conf.default sql-ledger.conf
	cp -r . ${D}/${MY_HTDOCSDIR}
	rm -rf ${D}/${MY_HTDOCSDIR}/doc
	
	einfo "Setting Server Ownership"
	# Files which must be server owned
	for so in `find users css templates spool`; do 
		webapp_serverowned ${MY_HTDOCSDIR}/${so}
	done

	einfo "Marking Config Files"
	#Config files
	webapp_configfile ${MY_HTDOCSDIR}/sql-ledger.conf

	keepdir ${MY_HTDOCSDIR}/spool

	webapp_postinst_txt en ${FILESDIR}/postinstall-en.txt

	webapp_src_install
}


