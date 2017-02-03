# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-r3

DESCRIPTION="Set of window manipulation tools"
HOMEPAGE="https://github.com/wmutils/core"
SRC_URI=""
EGIT_REPO_URI="https://github.com/wmutils/core.git"

LICENSE="ISC"
SLOT="0"
IUSE=""

RDEPEND="x11-libs/libxcb"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" MANPREFIX="/usr/share/man" install
}
