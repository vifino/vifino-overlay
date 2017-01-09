# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="LuaRadio is a lightweight, embeddable flow graph signal processing framework for software-defined radio"
HOMEPAGE="http://luaradio.io"
EGIT_REPO_URI="https://github.com/vsergeev/luaradio.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+rt"

DEPEND="
	rt? ( sci-libs/volk sci-libs/liquid-dsp sci-libs/fftw )
"
RDEPEND="${DEPEND}"

src_compile() {
	emake lib
}

src_install() {
	emake DESTDIR="${D}" install
}
