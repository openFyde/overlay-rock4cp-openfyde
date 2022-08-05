# Copyright (c) 2018 The Fyde OS Authors. All rights reserved.
# Distributed under the terms of the BSD

EAPI="5"

inherit appid2
DESCRIPTION="device appid"
HOMEPAGE="http://fydeos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
      doappid "{702F0101-DF17-42B7-BEEE-4B98EA404A42}" "CHROMEBOOK" "{552F8705-D588-43F8-8B17-CA199136982d}"
}
