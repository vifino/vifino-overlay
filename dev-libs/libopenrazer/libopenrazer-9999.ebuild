# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3 meson

DESCRIPTION="Qt wrapper around the D-Bus API from OpenRazer"
HOMEPAGE="https://github.com/z3ntu/libopenrazer"
EGIT_REPO_URI="https://github.com/z3ntu/libopenrazer.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~amd64-linux"
IUSE="razer-test"

DEPEND="
	app-misc/razer-test
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtxml:5
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-qt/linguist-tools:5
	virtual/pkgconfig
"

src_configure() {
	local emesonargs=(
		--buildtype release
		-Ddemo="false"
	)
	meson_src_configure
}
