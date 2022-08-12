# Copyright (c) 2022 The Fyde OS Authors. All rights reserved.
# Distributed under the terms of the BSD

EAPI="5"

DESCRIPTION="Specific bsp setups"

inherit cros-audio-configs udev
HOMEPAGE="http://fydeos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
  insinto /etc/init
  doins "${FILESDIR}/upstart/cras_plug_hdmi.conf"

  exeinto "/usr/bin/"
  doexe "${FILESDIR}"/scripts/*

  local audio_config_dir="${FILESDIR}/audio-config"
  install_audio_configs kevin "${audio_config_dir}"
}

