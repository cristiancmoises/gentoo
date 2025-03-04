# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

DESCRIPTION="A derived Emacs mode implementing most of the C# rules"
HOMEPAGE="https://github.com/emacs-csharp/csharp-mode"
SRC_URI="https://github.com/emacs-csharp/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
RESTRICT="test" # tries to install an old version of dash from the network

SITEFILE="50${PN}-gentoo.el"

src_install() {
	elisp-install ${PN} csharp-mode.el{,c}
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	dodoc README.org
}
