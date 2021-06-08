# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake-utils git-r3

DESCRIPTION="Gromit-MPX is a multi-pointer GTK3 port of the original Gromit desktop annotation tool."
HOMEPAGE="https://github.com/bk138/gromit-mpx"
EGIT_REPO_URI="https://github.com/bk138/gromit-mpx.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

RDEPEND="
	x11-libs/gtk+:3
	dev-libs/libappindicator:3
	x11-libs/libX11
	>=x11-apps/xinput-1.3
"
DEPEND="${RDEPEND}"
