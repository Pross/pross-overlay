# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop eutils pax-utils xdg

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

	doicon -s 256 "${FILESDIR}"/${PN}.png
	domenu "${FILESDIR}"/${PN}.desktop
	
	
	insinto /opt/popcorn
	doins -r .

	fperms +x /opt/popcorn/Popcorn-Time

	dosym ../../opt/popcorn/Popcorn-Time usr/bin/popcorntime-bin
	pax-mark -m "${ED%/}"/opt/popcorn/Popcorn-Time

}

pkg_postinst() {
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
	xdg_desktop_database_update
}

