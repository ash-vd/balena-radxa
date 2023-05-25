FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRC_URI_append_rockchip-px30-evb = " \
    file://PX30TRUST.ini \
"

do_compile_rockchip-px30-evb() {
    cp ${WORKDIR}/PX30TRUST.ini .
    tools/trust_merger PX30TRUST.ini
}

do_deploy_append_rockchip-px30-evb () {
    install -m 755 ${S}/rk33/px30_ddr_333MHz_v1.10.bin ${DEPLOYDIR}/rkbin
    install -m 755 ${S}/rk33/px30_miniloader_v1.15.bin ${DEPLOYDIR}/rkbin
}