# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/luakit/luakit-9999.ebuild,v 1.24 2014/12/11 15:01:11 perfinion Exp $

EAPI=5
EGIT_REPO_URI="https://github.com/luakit/${PN}.git"
EGIT_BRANCH=develop

inherit toolchain-funcs git-r3
IUSE="luajit pax_kernel vim-syntax +libunique"
KEYWORDS="~amd64 ~x86"
SRC_URI=""

DESCRIPTION="fast, small, webkit-gtk based micro-browser extensible by lua"
HOMEPAGE="http://mason-larobina.github.com/luakit/"

LICENSE="GPL-3"
SLOT="0"

COMMON_DEPEND="
	luajit? ( dev-lang/luajit:2 )
	!luajit? ( >=dev-lang/lua-5.1 )
	dev-db/sqlite:3
	dev-libs/glib:2
	dev-libs/libunique:1
	net-libs/libsoup:2.4
	net-libs/webkit-gtk:2
	x11-libs/gtk+:2
"

DEPEND="
	virtual/pkgconfig
	sys-apps/help2man
	pax_kernel? ( sys-apps/elfix )
	${COMMON_DEPEND}
"

RDEPEND="
	${COMMON_DEPEND}
	dev-lua/luafilesystem
	vim-syntax? ( || ( app-editors/vim app-editors/gvim ) )
"

src_prepare() {
	sed -i -e "/^CFLAGS/s/-ggdb//" config.mk || die
	# bug 385471
	use pax_kernel && sed "s,@\$(CC) -o \$@ \$(OBJS) \$(LDFLAGS),@\$(CC) \
		-o \$@ \$(OBJS) \$(LDFLAGS)\n\tpaxmark.sh -m luakit,g" -i Makefile
}

src_compile() {
	myconf="PREFIX=/usr DEVELOPMENT_PATHS=0"
	if use luajit; then
		myconf+=" USE_LUAJIT=1"
	else
		myconf+=" USE_LUAJIT=0"
	fi

	if ! use libunique; then
		myconf+=" USE_UNIQUE=0"
	fi

	if [[ ${PV} != *9999* ]]; then
		myconf+=" VERSION=${PV}"
	fi

	tc-export CC
	emake ${myconf}
}

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" DOCDIR="${D}/usr/share/doc/${PF}" install

	if use vim-syntax; then
		local t
		for t in $(ls "${S}"/extras/vim/); do
			insinto /usr/share/vim/vimfiles/"${t}"
			doins "${S}"/extras/vim/"${t}"/luakit.vim
		done
	fi
}
