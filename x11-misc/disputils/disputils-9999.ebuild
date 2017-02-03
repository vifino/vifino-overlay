# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-r3

DESCRIPTION="utilities for getting info about displays. @tudurom's personal fork"
HOMEPAGE="https://github.com/tudurom/disputils"
SRC_URI=""
EGIT_REPO_URI="https://github.com/tudurom/disputils.git"

LICENSE="ISC"
SLOT="0"
IUSE=""

RDEPEND="
	x11-libs/libxcb
	x11-misc/wmutils-core
"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" MANPREFIX="/usr/share/man" install
}
