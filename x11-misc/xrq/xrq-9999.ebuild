# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit git-r3

DESCRIPTION="X Resource Query, A program for querying the X Resources Database from the command line"
HOMEPAGE="https://github.com/arianon/xrq"
EGIT_REPO_URI="https://github.com/arianon/xrq.git"

LICENSE="ISC"
SLOT="0"

RDEPEND="x11-libs/libX11"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" MANPREFIX="/usr/share/man" install
}
