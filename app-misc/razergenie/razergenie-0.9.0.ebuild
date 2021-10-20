# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 meson

DESCRIPTION="Qt application for configuring your Razer devices under GNU/Linux."
HOMEPAGE="https://github.com/z3ntu/RazerGenie"
EGIT_REPO_URI="https://github.com/z3ntu/RazerGenie.git"
EGIT_COMMIT="7e4706058d2fec5ad72e6648edd3b091620c29f6"
EGIT_CLONE_TYPE="shallow"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~amd64-linux"

IUSE="doc"

RDEPEND="
	app-misc/openrazer[daemon]
	app-misc/razer-test
	dev-libs/libopenrazer
	dev-qt/qtcore
	dev-qt/qtdbus
	dev-qt/qtgui
	dev-qt/qtnetwork
	dev-qt/qtwidgets
"
DEPEND="${RDEPEND}"

DOCS=( README.md )

src_configure() {
	local emesonargs=(
		--buildtype release
		-Dinclude_matrix_discovery="true"
	)
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}
