# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

H=c1c68cc946eb31b6ba8faefdceffce1f77ca52df
NEED_EMACS=24.3

inherit elisp

DESCRIPTION="Emacs mode for the Lean 3 theorem prover"
HOMEPAGE="https://github.com/leanprover/lean-mode/"
SRC_URI="https://github.com/leanprover/${PN}/archive/${H}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${H}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=app-emacs/dash-2.18.1
	>=app-emacs/f-0.19.0
	>=app-emacs/flycheck-32
	>=app-emacs/s-1.10.0
"
RDEPEND="
	${DEPEND}
	sci-mathematics/lean:0/3
"

DOCS=( README.md )
SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	rm {company,helm}-lean.el || die

	elisp_src_prepare
}
