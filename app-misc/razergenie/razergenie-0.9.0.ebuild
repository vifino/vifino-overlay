# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3 meson

DESCRIPTION="Qt application for configuring your Razer devices under GNU/Linux."
HOMEPAGE="https://github.com/z3ntu/RazerGenie"
EGIT_REPO_URI="https://github.com/z3ntu/RazerGenie.git"
EGIT_CLONE_TYPE="shallow"
EGIT_COMMIT="7e4706058d2fec5ad72e6648edd3b091620c29f6"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~amd64-linux"

IUSE="doc"

DEPEND="
	dev-libs/libopenrazer
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
"
RDEPEND="${DDEPEND}"
BDEPEND="
	dev-qt/linguist-tools:5
	virtual/pkgconfig
"

DOCS=( README.md )

src_configure() {
	local emesonargs=(
		--buildtype release
		-Dinclude_matrix_discovery="true"
	)
	meson_src_configure
}


