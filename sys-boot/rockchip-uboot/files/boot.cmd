echo "Detected i2c4@62 charger circuit."
echo "It seems to be a rock pi."

setenv fdtfile /boot/dtbs/rockchip/rk3399-radxa-keyz.dtb

setenv rootpart 3
setenv linux_image /boot/Image
if test -e ${devtype} ${devnum}:${distro_bootpart} /boot/first-b.txt; then
  setenv rootpart 5
fi

part uuid ${devtype} ${devnum}:${rootpart} root_uuid
setenv bootargs rootwait ro cros_debug cros_secure cros_legacy console=ttyS2,1500000n8 root=PARTUUID=${root_uuid}
load ${devtype} ${devnum}:${rootpart} ${kernel_addr_r} ${linux_image}
load ${devtype} ${devnum}:${rootpart} ${fdt_addr_r} ${fdtfile}
booti ${kernel_addr_r} - ${fdt_addr_r}
