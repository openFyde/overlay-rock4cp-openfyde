# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The script helpers for factory mode of fydeos"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="amd64 arm arm64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=$FILESDIR

src_install() {
    insinto /boot/overlays
    doins ${FILESDIR}/overlays/*

	exeinto /usr/share/fydeos_shell/
	doexe ${FILESDIR}/dtbo.sh

	dosym /usr/share/fydeos_shell/dtbo.sh /usr/bin/dtbo
}
