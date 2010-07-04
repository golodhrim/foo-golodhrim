# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Original ebuild by Daniel Mettler, http://www.numlock.ch

inherit webapp eutils git

EGIT_REPO_URI="git://lx-office.linet-services.de/lx-office-crm.git"

DESCRIPTION="Lx-Office CRM is an Module for Lx-Office ERP."
HOMEPAGE="http://www.lx-office.org/"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
# Note: The "openoffice2pdf" use flag will install OpenOffice and the Xorg
# server. Two things one usually doesn't want install on a server. Therefore,
# information about the configuration necessary when using this flag is not
# provided.
IUSE=""

# Note: We have a dependency on Postgresql here although Postgresql could run
# on another server, actually.
DEPEND="=www-apps/lx-office-erp-9999"
RDEPEND=">=dev-db/postgresql-8
		dev-php/PEAR-MDB2
		dev-php/PEAR-MDB2_pgsql
		dev-php/PEAR-DB
		dev-php/PEAR-Mail_Mime
		dev-php/PEAR-Image_Color
		dev-php/PEAR-Image_Graph
		dev-php/PEAR-Image_Canvas
		dev-php/PEAR-Contact_Vcard_Build
		dev-php/PEAR-Contact_Vcard_Parse
		dev-php5/jpgraph
		media-fonts/freefont-ttf
		dev-lang/php[gd,imap]
		dev-php/xajax
		dev-php/fpdf
		dev-php/fpdi
"

# important: setting, don't remove it!
S="${WORKDIR}/${PN}"

src_unpack() {
	git_src_unpack
}

src_install() {
	webapp_src_preinst

	# Copy all the remaining files
	cp -R . ${D}/${MY_HTDOCSDIR}

	einfo "Setting Server Ownership"
	# Directories that must be server owned (incl. sub-directories)
	webapp_serverowned -R ${MY_HTDOCSDIR}/

	einfo "Config-protect some files"
	webapp_configfile ${MY_HTDOCSDIR}/config/lx-erp.conf
	webapp_configfile ${MY_HTDOCSDIR}/config/authentication.pl
	
	webapp_postinst_txt en ${FILESDIR}/postinstall-en.txt
	
	webapp_src_install
}

pkg_postinst() {
	elog ""
	elog "Install Lx-Office CRM using webapp-config:"
	elog "webapp-config -I -h host -d directory ${PN} ${PVR}"
	elog ""
	elog "After that, follow the instructions on the screen."
	elog ""
}
