# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils git-r3

DESCRIPTION="Soapy SDR plugins for UHD devices"
HOMEPAGE="http://github.com/pothosware/SoapyUHD/wiki"
EGIT_REPO_URI="https://github.com/pothosware/SoapyUHD.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS=""

RDEPEND="net-wireless/soapysdr net-wireless/uhd dev-libs/boost"
DEPEND="${RDEPEND}"
