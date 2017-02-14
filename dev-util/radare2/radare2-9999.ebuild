# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

is_live() { [[ ${PV} == 9999* ]]; }

is_live && inherit git-r3

DESCRIPTION="Advanced command line hexadecimal editor and more"
HOMEPAGE="http://www.radare.org"
is_live || SRC_URI="http://www.radare.org/get/${P}.tar.xz"
EGIT_REPO_URI="https://github.com/radare/radare2"

LICENSE="LGPL-3"
SLOT="0"
IUSE="ssl libressl +zip capstone"

RDEPEND="
	ssl? (
		!libressl? ( dev-libs/openssl:= )
		libressl? ( dev-libs/libressl )
	)
	zip? ( sys-libs/zlib dev-libs/libzip )
	capstone? ( dev-libs/capstone )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

src_configure() {
	econf \
		$(use_with ssl openssl) \
		$(use_with zip syszip) \
		$(use_with capstone syscapstone)
}
