# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3
EGIT_REPO_URI="https://github.com/vedderb/vesc_tool.git"

DESCRIPTION="VESC Tool"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86 ~arm ~arm64 ~ppc64"

IUSE="can +bluetooth gps libressl"

DEPEND="
	sys-devel/flex
	sys-devel/bison
	x11-base/xorg-x11
	x11-libs/libxcb
	virtual/libudev
	virtual/libusb
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )
	dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	dev-qt/qtprintsupport:5
	dev-qt/qtnetwork:5
	dev-qt/qtquickcontrols2:5
	dev-qt/qtserialport:5
	bluetooth? (
		net-wireless/bluez
		dev-qt/qtbluetooth:5
	)
	can? ( dev-qt/qtserialbus:5 )
	gps? ( dev-qt/qtpositioning:5 )
"

RDEPEND="${DEPEND}"

src_configure() {
	DEFS="DEFINES ="
	use bluetooth && DEFS="$DEFS HAS_BLUETOOTH"
	use can       && DEFS="$DEFS HAS_SERIALBUS"
	use gps       && DEFS="$DEFS HAS_POSITIONING"

	# Patch out mandatory HAS_* defines. We wanna set them manually.
	sed -i 's/^DEFINES += HAS/#DEFINES += HAS/g' vesc_tool.pro
	qmake -config release "CONFIG += release_lin build_original" "$DEFS"
}

src_install() {
	newbin build/lin/vesc_tool_* vesc_tool
}
