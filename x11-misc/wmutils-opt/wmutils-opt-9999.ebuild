# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-r3

DESCRIPTION="Optional addons to wmutils-core"
HOMEPAGE="https://github.com/wmutils/opt"
SRC_URI=""
EGIT_REPO_URI="https://github.com/wmutils/opt.git"

LICENSE="ISC"
SLOT="0"
IUSE=""

src_install() {
	emake DESTDIR="${D}" MANPREFIX="/usr/share/man" install
}
