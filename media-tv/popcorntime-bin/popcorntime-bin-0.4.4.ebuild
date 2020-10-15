# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils xdg-utils 

DESCRIPTION="Watch torrent movies instantly"
HOMEPAGE="https://popcorntime.app/"
SRC_URI="https://github.com/popcorn-official/popcorn-desktop/releases/download/v${PV}/Popcorn-Time-${PV}-linux64.zip"

LICENSE="GPL-3"
SLOT="0"

IUSE=""
RESTRICT="splitdebug strip"
KEYWORDS="~amd64 ~x86"
DEPEND=""
RDEPEND="dev-libs/nss
	gnome-base/gconf
	media-fonts/corefonts
	media-libs/alsa-lib
	x11-libs/gtk+:2"

S="${WORKDIR}"

src_install() {
	insinto /opt/${PN}
    	doins -r .
	fperms +x /opt/${PN}/Popcorn-Time
	dosym /$(get_libdir)/libudev.so.1 /opt/${PN}/libudev.so.0
	dosym /opt/${PN}/Popcorn-Time /usr/bin/${PN}

	domenu "${FILESDIR}"/${PN}.desktop

	doicon -s 256 "${FILESDIR}"/${PN}.png
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

