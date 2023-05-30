DESCRIPTION = "Rockchip PX30 EVB U-Boot"
LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"

require recipes-bsp/u-boot/u-boot.inc

DEPENDS_append = " bison-native rk-binary-native "

SRC_URI = " \
    git://github.com/u-boot/u-boot;protocol=https \
"

S = "${WORKDIR}/git"

do_install_append() {
    install -d ${D}/boot
    install -c -m 0644 ${B}/idbloader.bin ${B}/uboot.img ${D}/boot
}

do_deploy_append() {
    install ${B}/idbloader.bin ${DEPLOYDIR}
    install ${B}/uboot.img ${DEPLOYDIR}
}

do_compile[depends] += "rk-binary-native:do_install"