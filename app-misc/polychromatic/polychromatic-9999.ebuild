# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit python-r1 git-r3 meson

DESCRIPTION="Polychromatic is a frontend for OpenRazer that enables Razer devices to control lighting effects and more on GNU/Linux."
HOMEPAGE="https://polychromatic.app"
EGIT_REPO_URI="https://github.com/polychromatic/polychromatic.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="GPL-3"
SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	app-misc/openrazer[client,${PYTHON_USEDEP}]
	dev-libs/libappindicator:3
	>=dev-python/colorama-0.4.4[${PYTHON_USEDEP}]
	dev-python/colour[${PYTHON_USEDEP}]
	dev-python/distro[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/setproctitle[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/PyQt5[${PYTHON_USEDEP}]
	dev-python/PyQtWebEngine[${PYTHON_USEDEP}]
	dev-qt/qtsvg
"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-lang/sassc
"


