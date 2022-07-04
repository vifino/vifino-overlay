# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="LuaRadio is a lightweight, embeddable flow graph signal processing framework for software-defined radio"
HOMEPAGE="https://luaradio.io"
EGIT_REPO_URI="https://github.com/vsergeev/luaradio.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+rt"

DEPEND="
	>=dev-lang/luajit-2.0.4
	rt? ( net-libs/volk net-libs/liquid-dsp sci-libs/fftw )
"
RDEPEND="${DEPEND}"

src_compile() {
	cd embed
	emake PREFIX=/usr lib
}

src_install() {
	cd embed
	emake DESTDIR="${D}" PREFIX=/usr install
}
