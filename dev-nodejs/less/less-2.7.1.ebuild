# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
DESCRIPTION="Leaner CSS"
HOMEPAGE="http://lesscss.org/"
SRC_URI="https://github.com/${PN}/${PN}.js/archive/v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

RDEPEND=">=net-libs/nodejs-0.4.2"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}.js-${PV}"

src_compile() {
	:
}

src_install() {
	# Ugly but package does not provide a clean way to install itself,
	# needs npm
	insinto usr/lib/${PN}/
	doins -r lib bin

	chmod +x "${D}"/usr/lib/${PN}/bin/lessc
	dosym "${D}"/usr/lib/${PN}/bin/lessc usr/bin/lessc

	dodoc README.md CONTRIBUTING.md CHANGELOG.md
}
