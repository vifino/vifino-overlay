# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit git-r3

DESCRIPTION="utilities for getting info about displays. @tudurom's personal fork"
HOMEPAGE="https://github.com/tudurom/disputils"
EGIT_REPO_URI="https://github.com/tudurom/disputils.git"

LICENSE="ISC"
SLOT="0"

RDEPEND="
	x11-libs/libxcb
	x11-misc/wmutils-core
"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" MANPREFIX="/usr/share/man" install
}
