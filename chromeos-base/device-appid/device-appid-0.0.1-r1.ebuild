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
      doappid "{9961AADF-7C3F-46FB-ABAB-8B1BE314DB72}" "CHROMEBOOK" "{3CF9D67A-B014-42F0-A320-7B989AC66C28}"
}
