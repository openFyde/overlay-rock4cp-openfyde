# Copyright 2017 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_REPO="https://github.com/FydeOS-for-You-overlays"
CROS_WORKON_COMMIT="20b7e6b036385a49fc04b023fcb87ff2121ef336"
CROS_WORKON_EGIT_BRANCH="rs124"

CROS_WORKON_PROJECT="kernel-rockchip"
CROS_WORKON_LOCALNAME="/kernel/rockchip-kernel"
CROS_WORKON_INCREMENTAL_BUILD="1"

DEPEND="!sys-kernel/chromeos-kernel-4_4"
RDEPEND="${DEPEND}"

# AFDO_PROFILE_VERSION is the build on which the profile is collected.
# This is required by kernel_afdo.
#
# TODO: Allow different versions for different CHROMEOS_KERNEL_SPLITCONFIGs

# Auto-generated by PFQ, don't modify.
#AFDO_PROFILE_VERSION="R77-12236.0-1559554500"

# Set AFDO_FROZEN_PROFILE_VERSION to freeze the afdo profiles.
# If non-empty, it overrides the value set by AFDO_PROFILE_VERSION.
# Note: Run "ebuild-<board> /path/to/ebuild manifest" afterwards to create new
# Manifest file.
#AFDO_FROZEN_PROFILE_VERSION=""

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2

HOMEPAGE="https://github.com/ayufan-rock64/linux-kernel/"
DESCRIPTION="Rockchip Linux Kernel 4.4"
KEYWORDS="*"

#src_compile() {
#	tc-export ${CHOST}-pkg-config
#	cros-kernel2_src_compile PKG_CONFIG="$(tc-getPKG_CONFIG)"
#}

src_install() {
  cros-kernel2_src_install
  local kernel_dir=$(cros-workon_get_build_dir)
  local kernel_arch=${CHROMEOS_KERNEL_ARCH:-$(tc-arch-kernel)}
  local kernel_release=$(kernelrelease)
  local kernel_version=$(kmake -s kernelversion)

  info "Install /boot/dtbs/"
  kmake INSTALL_DTBS_PATH="${D}/boot/dtbs/" dtbs_install

  dosym /boot/Image-${kernel_release} /boot/Image
}
