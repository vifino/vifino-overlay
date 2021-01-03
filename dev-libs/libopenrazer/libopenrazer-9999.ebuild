# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 meson

DESCRIPTION="Qt wrapper around the D-Bus API from OpenRazer"
HOMEPAGE="https://github.com/z3ntu/libopenrazer"
EGIT_REPO_URI="https://github.com/z3ntu/libopenrazer.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~amd64-linux"

RDEPEND="
	app-misc/openrazer[daemon]
	app-misc/razer-test
	dev-qt/qtcore
	dev-qt/qtdbus
	dev-qt/qtgui
	dev-qt/qtxml
"
DEPEND="${RDEPEND}"

src_configure() {
	local emesonargs=(
		--buildtype release
		-Ddemo="false"
	)
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}
