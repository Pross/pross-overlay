# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2+ pypy{,3} )

inherit distutils-r1

DESCRIPTION="IMDbPY is a Python package for retrieving and managing the data of the IMDb movie database about movies and people"
HOMEPAGE="https://imdbpy.github.io/"
SRC_URI="https://files.pythonhosted.org/packages/ea/4d/6b93b77fe7150057df105a89e1c7eb84095c6e42d41058d4b5dc5bd2946d/IMDbPY-2020.9.25.tar.gz"

DEPEND=""
RDEPEND=""

IUSE=""
SLOT="0"
LICENSE="GPL2"
KEYWORDS="*"

S="${WORKDIR}/IMDbPY-${PV}"
