# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..10} )

inherit git-r3 distutils-r1

EGIT_REPO_URI="https://github.com/vaab/colour.git"
EGIT_CLONE_TYPE="single"
EGIT_COMMIT="0.1.5"

DESCRIPTION="Converts and manipulates common color representation (RGB, HSL, web, ect.)"
HOMEPAGE="
	https://pypi.org/project/colour/
	https://github.com/vaab/colour
"

DEPEND="dev-python/d2to1"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux"

python_install_all() {
	distutils-r1_python_install_all
}
