# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

# Require python-2 with sqlite USE flag
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="sqlite(+)"

inherit eutils python-single-r1 user

MY_P="${P/sab/SAB}"

DESCRIPTION="Binary newsgrabber in Python, with web-interface. Successor of old SABnzbd project"
HOMEPAGE="http://www.sabnzbd.org/"
SRC_URI="https://github.com/sabnzbd/sabnzbd/releases/download/1.2.0//${MY_P}-src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	app-arch/par2cmdline
	app-arch/unrar
	app-arch/unzip
	dev-python/cheetah
	dev-python/pyopenssl
	dev-python/yenc
"

S="${WORKDIR}/${MY_P}"
DHOMEDIR="/var/${PN}"

pkg_setup() {
	# Control PYTHON_USE_WITH
	python-single-r1_pkg_setup

	# Create sabnzbd group
	enewgroup ${PN}
	# Create sabnzbd user, put in sabnzbd group
	enewuser ${PN} -1 -1 -1 ${PN}
}

src_install() {
	dodoc {ABOUT,ISSUES,README}.txt scripts/{Sample-PostProc.sh,Sample-PostProc.cmd}

	newconfd "${FILESDIR}/${PN}.conf" ${PN}
	newinitd "${FILESDIR}/${PN}.init" ${PN}
	keepdir /var/{${PN}/{admin,backup,cache,complete,download,dirscan},log/${PN}}
	fowners -R ${PN}:${PN} /var/{${PN}/{,admin,backup,cache,complete,download,dirscan},log/${PN}}

	# Default configuration file and directory

	insinto /etc/${PN}
	insopts -m0660 -o ${PN} -g ${PN}
	doins "${FILESDIR}/${PN}.ini"

	# Add themes & code into /usr/share
	insinto /usr/share/${PN}
	doins -r cherrypy email gntp icons interfaces locale po sabnzbd SABnzbd.py tools util
}

pkg_postinst() {

	elog "SABnzbd has been installed with default directories in /var/${PN}"
	elog
	elog "New user/group ${PN}/${PN} has been created"
	elog
	elog "Config file is located in /etc/${PN}/${PN}.ini"
	elog
	elog "Please configure /etc/conf.d/${PN} before starting as daemon!"
	elog
	elog "Start with ${ROOT}etc/init.d/${PN} start"
	elog "Visit http://<host ip>:8080 to configure SABnzbd"
	elog "Default web username/password : sabnzbd/secret"
	elog
}

