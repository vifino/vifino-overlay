# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 meson

DESCRIPTION="A work-in-progress replacement for OpenRazer"
HOMEPAGE="https://github.com/z3ntu/razer_test"
EGIT_REPO_URI="https://github.com/z3ntu/razer_test.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~amd64-linux"

RDEPEND="
	virtual/libudev
	dev-libs/hidapi
	dev-qt/qtcore
	dev-qt/qtdbus
"
DEPEND="${RDEPEND}"

src_configure() {
	local emesonargs=(
		--buildtype release
		-Dbuild_bringup_util="true"
		-Dbuild_tests="false"
	)
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}
