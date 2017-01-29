# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 linux-mod

DESCRIPTION="Razer Drivers for Linux"
HOMEPAGE="https://terrycain.github.io/razer-drivers/"
EGIT_REPO_URI="https://github.com/terrycain/razer-drivers.git"
EGIT_CLONE_TYPE="shallow"

# TODO: Make use of the python eclass? At the moment, it's just hackishly using whatever python3 interpreter the system has installed.

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	media-libs/libsdl2
	media-libs/sdl2-image
	sci-libs/fftw:3.0

	>=dev-lang/python-3.4.5
	dev-python/dbus-python
	dev-python/pygobject
	dev-python/setproctitle
	dev-python/python-evdev
	dev-python/pyudev
	dev-python/notify2
	x11-misc/xautomation
	x11-misc/xdotool

	dev-python/numpy
"
DEPEND="${RDEPEND}
	app-misc/jq
"

# This is a bit weird, but it's end result is what we want.
BUILD_TARGETS="clean modules"
BUILD_PARAMS="-j1 -C /usr/src/linux SUBDIRS=${S}/driver"
MODULE_NAMES="
	razerkbd(hid:${S}/driver)
	razermouse(hid:${S}/driver)
	razerfirefly(hid:${S}/driver)
	razerkraken(hid:${S}/driver)
	razermug(hid:${S}/driver)
	razercore(hid:${S}/driver)
"

src_install() {
	linux-mod_src_install
	emake DESTDIR="${D}" \
		udev_install \
		daemon_install \
		python_library_install
}
