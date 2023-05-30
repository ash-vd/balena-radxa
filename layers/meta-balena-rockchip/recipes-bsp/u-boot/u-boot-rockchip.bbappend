UBOOT_KCONFIG_SUPPORT = "1"

inherit resin-u-boot

FILESEXTRAPATHS:append := ":${THISDIR}/files"

# rework meta-resin patch whose context is different now in u-boot v2019.4
# SRC_URI_remove = "file://resin-specific-env-integration-kconfig.patch"

# SRC_URI_append_smarc-px30 = " \
#    file://0001-resin-specific-env-integration-kconfig_REWORKED-lec-px30.patch \
#    file://0000-rockchip-add-support-for-px30.patch \
#    file://0001-lec-px30.patch \
#"

SRCREV_rockchip-px30-evb  = "v2019.10"

do_compile:append_rockchip-px30-evb() {
    tools/mkimage -n rk3399 -T rksd -d ${DEPLOY_DIR_IMAGE}/rkbin/rk3399_ddr_800MHz_v1.14.bin idbloader.bin
    cat ${DEPLOY_DIR_IMAGE}/rkbin/rk3399_miniloader_v1.15.bin >> idbloader.bin
    ${DEPLOY_DIR_IMAGE}/rkbin/tools/loaderimage --pack --uboot ./u-boot-dtb.bin uboot.img 0x200000
}