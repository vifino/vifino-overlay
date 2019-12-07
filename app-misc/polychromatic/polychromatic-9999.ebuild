# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 linux-mod

DESCRIPTION="A graphical front end for managing Razer peripherals under GNU/Linux."
HOMEPAGE="https://github.com/lah7/polychromatic"
EGIT_REPO_URI="https://github.com/lah7/polychromatic.git"
EGIT_CLONE_TYPE="shallow"

# TODO: Make use of the python eclass?

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
    app-misc/openrazer
    dev-nodejs/less
    >=dev-lang/python-3.4.5
    dev-python/distro
    dev-python/pygobject
    dev-python/setproctitle
    dev-python/requests
    x11-libs/gtk+[introspection]
    dev-libs/libappindicator:3[introspection]
    net-libs/webkit-gtk[introspection]
"
DEPEND="${RDEPEND}"

src_install() {
    emake PREFIX=/usr DESTDIR="${D}" install
}
