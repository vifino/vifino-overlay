# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5,6} pypy{,3} )

inherit distutils-r1 python-r1

DESCRIPTION="daemonize is a library for writing system daemons in Python"
HOMEPAGE="https://github.com/thesharp/daemonize"
SRC_URI="https://github.com/thesharp/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ia64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND=">=dev-python/setuptools-33.1.1[${PYTHON_USEDEP}]"
