# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="Software-Defined Radio Digital Signal Processing Library"
HOMEPAGE="http://liquidsdr.org"
EGIT_REPO_URI="https://github.com/jgaeddert/liquid-dsp.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

IUSE="+fftw"
RDEPEND="
	fftw? ( sci-libs/fftw )
"
DEPEND="${RDEPEND}"

src_configure() {
	einfo "Regenerating autotools files..."
	aclocal || die "aclocal failed"
	autoconf || die "autoconf failed"
	autoheader || die "autheader failed"

	econf
}
