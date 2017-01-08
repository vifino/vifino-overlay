# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils git-r3

DESCRIPTION="remote support for Soapy SDR"
HOMEPAGE="http://github.com/pothosware/SoapySDR"
EGIT_REPO_URI="https://github.com/pothosware/SoapyRemote.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS=""

RDEPEND="net-wireless/soapysdr"
DEPEND="${RDEPEND}"
