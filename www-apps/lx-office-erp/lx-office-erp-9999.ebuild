# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Original ebuild by Daniel Mettler, http://www.numlock.ch

inherit webapp eutils git

EGIT_REPO_URI="git://lx-office.linet-services.de/lx-office-erp.git"

DESCRIPTION="Lx-Office ERP is a fork of the accounting package SQL-Ledger adapted to German/Austrian/Swiss requirements."
HOMEPAGE="http://www.lx-office.org/"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
# Note: The "openoffice2pdf" use flag will install OpenOffice and the Xorg
# server. Two things one usually doesn't want install on a server. Therefore,
# information about the configuration necessary when using this flag is not
# provided.
IUSE="openoffice2pdf"

# Note: We have a dependency on Postgresql here although Postgresql could run
# on another server, actually.
DEPEND=""
RDEPEND=">=dev-db/postgresql-server-8
		dev-lang/perl
		dev-perl/DBI
		dev-perl/DBD-Pg
		dev-perl/CGI-Ajax
		dev-perl/Class-Accessor
		dev-perl/Archive-Zip
		dev-perl/Text-Iconv
		dev-perl/Text-CSV_XS
		dev-perl/IO-stringy
		dev-perl/PDF-API2
		dev-perl/yaml
		dev-perl/Template-Toolkit
		openoffice2pdf? ( >=app-office/openoffice-2 x11-base/xorg-server )
"
need_httpd_cgi

# important: setting, don't remove it!
S="${WORKDIR}/${PN}"

src_unpack() {
	git_src_unpack
}

src_install() {
	webapp_src_preinst

	einfo "Installing docs"
	for docfile in `find doc -type f \! -name "*.html"`; do
		dodoc ${docfile} || die "dodoc of ${docfile} failed"
	done
	einfo "Installing HTML docs"
	dohtml -r doc/INSTALL doc/ustva.html doc/dokumentenvorlagen-und-variablen.html
	# Delete docs from the working directory as we've already done dodoc and dohtml
	rm -rf doc	
	
	einfo "Creating config files based on default config files"
	# Note that the main config file (conf/lx-erp.conf) already exists
	einfo "creating config/authentication.pl"
	cp config/authentication.pl.default config/authentication.pl
	
	# Copy all the remaining files
	cp -R . ${D}/${MY_HTDOCSDIR}

	einfo "Setting Server Ownership"
	# Directories that must be server owned (incl. sub-directories)
	webapp_serverowned -R ${MY_HTDOCSDIR}/datev
	webapp_serverowned -R ${MY_HTDOCSDIR}/users
	webapp_serverowned -R ${MY_HTDOCSDIR}/spool
	webapp_serverowned -R ${MY_HTDOCSDIR}/webdav

	einfo "Config-protect some files"
	webapp_configfile ${MY_HTDOCSDIR}/config/lx-erp.conf
	webapp_configfile ${MY_HTDOCSDIR}/config/authentication.pl
	
	webapp_postinst_txt en ${FILESDIR}/postinstall-en.txt
	
	webapp_src_install
}

pkg_postinst() {
	elog ""
	elog "Install Lx-Office ERP using webapp-config:"
	elog "webapp-config -I -h host -d directory ${PN} ${PVR}"
	elog ""
	elog "After that, follow the instructions on the screen."
	elog ""
}
