# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PATCH_VER="6"

inherit toolchain

KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="${CATEGORY}/binutils"

src_prepare() {
	has_version '>=sys-libs/glibc-2.32-r1' && rm -v "${WORKDIR}/patch/23_all_disable-riscv32-ABIs.patch"
	toolchain_src_prepare
}
