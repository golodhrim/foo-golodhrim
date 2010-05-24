# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Doublestroke Font for ConTeXt Minimals"
HOMEPAGE="http://www.tex.ac.uk/tex-archive/fonts/doublestroke"
SRC_URI="http://www.tex.ac.uk/tex-archive/fonts/doublestroke/Udsrom.fd
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/Udsss.fd
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsdoc.pdf
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsdoc.tex
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsfont.sty
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsrom.mf
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsrom8.mf
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsrom8.pfb
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsrom8.tfm
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsrom10.mf
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsrom10.pfb
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsrom10.tfm
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsrom12.mf
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsrom12.pfb
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsrom12.tfm
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsromo.mf
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsromu.mf
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsss8.mf
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsss8.pfb
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsss8.tfm
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsss10.mf
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsss10.pfb
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsss10.tfm
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsss12.mf
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsss12.pfb
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dsss12.tfm
http://www.tex.ac.uk/tex-archive/fonts/doublestroke/dstroke.map"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc ~ia64"
IUSE=""

DEPEND="app-text/context-minimals"
RDEPEND="${DEPEND}"

src_unpack() {
	cp ${DISTDIR}/Uds*.fd ${WORKDIR}
	cp ${DISTDIR}/ds*.pdf ${WORKDIR}
	cp ${DISTDIR}/ds*.tex ${WORKDIR}
	cp ${DISTDIR}/ds*.sty ${WORKDIR}
	cp ${DISTDIR}/ds*.mf ${WORKDIR}
	cp ${DISTDIR}/ds*.tfm ${WORKDIR}
	cp ${DISTDIR}/ds*.pfb ${WORKDIR}
	cp ${DISTDIR}/ds*.map ${WORKDIR}
}

src_install() {
	mkdir -p ${D}/opt/context-minimals/tex/texmf/fonts/type1/public/doublestroke
	mkdir -p ${D}/opt/context-minimals/tex/texmf/fonts/tfm/public/doublestroke
	mkdir -p ${D}/opt/context-minimals/tex/texmf/fonts/source/public/doublestroke
	mkdir -p ${D}/opt/context-minimals/tex/texmf/doc/fonts/doublestroke
	mkdir -p ${D}/opt/context-minimals/tex/texmf/fonts/map/dvips/doublestroke
	mkdir -p ${D}/opt/context-minimals/tex/texmf/fonts/map/pdftex/doublestroke
	cp ${WORKDIR}/*.tfm ${D}/opt/context-minimals/tex/texmf/fonts/tfm/public/doublestroke/
	cp ${WORKDIR}/*.pfb ${D}/opt/context-minimals/tex/texmf/fonts/type1/public/doublestroke/
	cp ${WORKDIR}/*.mf ${D}/opt/context-minimals/tex/texmf/fonts/source/public/doublestroke/
	cp ${WORKDIR}/*.map ${D}/opt/context-minimals/tex/texmf/fonts/map/dvips/doublestroke/
	cp ${WORKDIR}/*.map ${D}/opt/context-minimals/tex/texmf/fonts/map/pdftex/doublestroke/
	cp ${WORKDIR}/*.tex ${D}/opt/context-minimals/tex/texmf/doc/fonts/doublestroke/
	cp ${WORKDIR}/*.pdf ${D}/opt/context-minimals/tex/texmf/doc/fonts/doublestroke/
	cp ${WORKDIR}/*.sty	${D}/opt/context-minimals/tex/texmf/doc/fonts/doublestroke/
	cp ${WORKDIR}/*.fd ${D}/opt/context-minimals/tex/texmf/doc/fonts/doublestroke/
}

