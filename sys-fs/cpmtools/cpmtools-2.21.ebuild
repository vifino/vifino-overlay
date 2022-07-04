# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="This package allows to access CP/M file systems similar to the well-known mtools package, which accesses MSDOS file systems"
HOMEPAGE="http://www.moria.de/~michael/cpmtools/"
SRC_URI="http://www.moria.de/~michael/cpmtools/files/cpmtools-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="amd64 x86"

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}"

src_configure() {
	econf prefix="/usr" MANDIR="/usr/share/man"
}

src_install() {
	emake prefix="${D}/usr" MANDIR="${D}/usr/share/man" install || die "Install failed"
}
