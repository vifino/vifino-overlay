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
	app-misc/razer-drivers

	>=dev-lang/python-3.4.5
	dev-python/pygobject
	dev-python/setproctitle
	dev-python/requests

	x11-libs/gtk+[introspection]
	dev-libs/libappindicator:3[introspection]
	net-libs/webkit-gtk[introspection]
"
DEPEND="${RDEPEND}
	net-misc/rsync
"

src_install() {
	pythondir=$(python3 -c 'import sys; print(sys.path[-1])')
	dobin ${PN}-controller ${PN}-tray-applet

	mkdir -p "${D}/usr/share"
	cp -r "${S}/data" "${D}/usr/share/${PN}"

	mkdir -p "${D}/${pythondir}"
	cp -r "${S}/pylib" "${D}/${pythondir}/${PN}"

	mkdir -p "${D}/usr/share/icons/hicolor/scalable/apps"
	cp "${S}/install/hicolor/scalable/apps/${PN}.svg" "${D}/usr/share/icons/hicolor/scalable/apps/${PN}.svg"

	mkdir -p "${D}/usr/share/locale"
	rsync -rlpt --exclude="${PN}-controller.pot" --exclude="${PN}-tray-applet.pot" --exclude=*.po "${S}/locale/" "${D}/usr/share/locale"

	mkdir "${D}/usr/share/applications"
	mkdir "${D}/etc/xdg/autostart"
	cp "${S}/install/${PN}-controller.desktop" "${S}/install/${PN}-tray-applet.desktop" "${D}/usr/share/applications"
	cp "${S}/install/${PN}-tray-applet.desktop" "${D}/etc/xdg/autostart"
}
