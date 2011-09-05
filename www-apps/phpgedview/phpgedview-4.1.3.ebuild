# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp depend.php

MY_PN="PhpGedView-all"
DESCRIPTION="A genealogy program which allows you to view and edit your genealogy on your website"
HOMEPAGE="http://www.phpgedview.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_PN}-${PV}.zip"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE="calendar"

DEPEND="app-arch/unzip"
RDEPEND="virtual/httpd-cgi"

need_php_httpd

S="${WORKDIR}"

pkg_setup() {
	local flags="xml"
	use calendar && flags="${flags} calendar"
	local dbs="mssql mysql mysqli postgres sqlite"

	ewarn "${PN} supports the following DB backends: ${dbs}"
	ewarn "Support for at least one of them is required in PHP. Index mode is not supported any more!"

	if ! PHPCHECKNODIE="yes" require_php_with_use ${flags} || \
		! PHPCHECKNODIE="yes" require_php_with_any_use gd gd-external || \
			! PHPCHECKNODIE="yes" require_php_with_any_use ${dbs} ; then
				die "Re-install ${PHP_PKG} with ${flags}, either gd or gd-external and at least one of ${dbs} in USE."
	fi

	webapp_pkg_setup
}

src_install() {
	webapp_src_preinst

	dodoc changelog.txt
	rm -f {changelog,GPL}.txt

	dodir ${MY_HOSTROOTDIR}/${PF}
	cp -R * "${D}"${MY_HTDOCSDIR}
	mv "${D}"${MY_HTDOCSDIR}/index "${D}"/${MY_HOSTROOTDIR}/${PF}

	local configs="config_gedcom.php config.php config_download.php"
	local servers="config.php media"

	for a in ${configs}; do
		webapp_configfile "${MY_HTDOCSDIR}/${a}"
	done
	for b in ${servers}; do
		webapp_serverowned "${MY_HTDOCSDIR}/${b}"
	done
	webapp_serverowned "${MY_HOSTROOTDIR}/${PF}/index"
	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt

	webapp_src_install
}
