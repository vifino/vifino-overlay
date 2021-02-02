# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 linux-mod meson

DESCRIPTION="A graphical front end for managing Razer peripherals under GNU/Linux."
HOMEPAGE="https://github.com/lah7/polychromatic"
EGIT_REPO_URI="https://github.com/lah7/polychromatic.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	app-misc/openrazer[client]
	dev-util/intltool
	dev-lang/sassc
	dev-libs/libappindicator:3
	>=dev-lang/python-3.7.0
	>=dev-python/colorama-0.4.4
	dev-python/colour
	dev-python/distro
	dev-python/pygobject
	dev-python/setproctitle
	dev-python/requests
	dev-python/PyQt5
	dev-python/PyQtWebEngine
	dev-qt/qtsvg
"
DEPEND="${RDEPEND}"

src_configure() {
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}
