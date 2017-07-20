#this is platform common Boardconfig

# Use the non-open-source part, if present
-include vendor/mediatek/common/BoardConfigVendor.mk

# for flavor build base project assignment
ifeq ($(strip $(MTK_BASE_PROJECT)),)
  MTK_PROJECT_NAME := $(subst full_,,$(TARGET_PRODUCT))
else
  MTK_PROJECT_NAME := $(MTK_BASE_PROJECT)
endif
MTK_PROJECT := $(MTK_PROJECT_NAME)
MTK_PATH_SOURCE := vendor/mediatek/proprietary
MTK_ROOT := vendor/mediatek/proprietary
MTK_PATH_COMMON := vendor/mediatek/proprietary/custom/common
MTK_PATH_CUSTOM := vendor/mediatek/proprietary/custom/$(MTK_PROJECT)
MTK_PATH_CUSTOM_PLATFORM := vendor/mediatek/proprietary/custom/$(shell echo $(MTK_PLATFORM) | tr '[A-Z]' '[a-z]')

#MTK_PLATFORM := $(shell echo $(MTK_PROJECT_NAME) | awk -F "_" {'print $$1'})
MTK_PATH_PLATFORM := $(MTK_PATH_SOURCE)/platform/$(shell echo $(MTK_PLATFORM) | tr '[A-Z]' '[a-z]')
MTK_PATH_KERNEL := kernel
GOOGLE_RELEASE_RIL := no
BUILD_NUMBER := $(shell date +%s)

#SELinux Policy File Configuration
BOARD_SEPOLICY_DIRS := \
        device/mediatek/common/sepolicy 

#SELinux: MTK modified
ifeq ($(MTK_INTERNAL),yes)
  BOARD_SEPOLICY_REPLACE := \
    keys.conf 
else
  ifeq ($(MTK_SIGNATURE_CUSTOMIZATION),yes)
    BOARD_SEPOLICY_REPLACE := \
      keys.conf 
  else
    BOARD_SEPOLICY_REPLACE :=
  endif
endif

#SELinux: MTK added
BOARD_SEPOLICY_UNION := \
    app.te \
    device.te \
    domain.te \
    file.te \
    file_contexts \
    fs_use \
    installd.te \
    net.te \
    netd.te \
    te_macros \
    vold.te \
    untrusted_app.te \
    zygote.te \
    aal.te \
    abcc.te \
    adb.te \
    add_property_tag.te \
    aee_aed.te \
    aee_core_forwarder.te \
    aee_dumpstate.te \
    aee.te \
    agpscacertinit.te \
    akmd09911.te \
    akmd8963.te \
    akmd8975.te \
    ami304d.te \
    am.te \
    applypatch_static.te \
    applypatch.te \
    asan_app_process.te \
    asanwrapper.te \
    atcid.te \
    atci_service.te \
    atrace.te \
    audiocmdservice_atci.te \
    audiocommand.te \
    audioloop.te \
    audioregsetting.te \
    AudioSetParam.te \
    autofm.te \
    autosanity.te \
    badblocks.te \
    batterywarning.te \
    bdt.te \
    BGW.te \
    bmgr.te \
    bmm050d.te \
    bootanimation.te \
    boot_logo_updater.te \
    btconfig.te \
    btif_tester.te \
    btlogmask.te \
    btool.te \
    bugreport.te \
    bu.te \
    campipetest.te \
    camshottest.te \
    ccci_fsd.te \
    ccci_mdinit.te \
    check_lost_found.te \
    check_prereq.te \
    cjpeg.te \
    codec.te \
    content.te \
    corrupt_gdt_free_blocks.te \
    cpueater.te \
    cpustats.te \
    cputime.te \
    daemonize.te \
    dalvikvm.te \
    decoder.te \
    dexdump.te \
    dexopt.te \
    dhcp6c.te \
    dhcp6ctl.te \
    dhcp6s.te \
    directiotest.te \
    djpeg.te \
    dm_agent_binder.te \
    dualmdlogger.te \
    dumpstate.te \
    dumpsys.te \
    e2fsck.te \
    emcsmdlogger.te \
    em_svr.te \
    ext4_resize.te \
    factory.te \
    fbconfig.te \
    featured.te \
    flash_image.te \
    fsck_msdos_mtk.te \
    fsck_msdos.te \
    gatord.te \
    gdbjithelper.te \
    gdbserver.te \
    geomagneticd.te \
    GoogleOtaBinder.te \
    gsm0710muxdmd2.te \
    gsm0710muxd.te \
    gzip.te \
    hald.te \
    hdc.te \
    ime.te \
    InputDispatcher_test.te \
    InputReader_test.te \
    input.te \
    ip6tables.te \
    ipod.te \
    ipohctl.te \
    iptables.te \
    ip.te \
    keystore_cli.te \
    kfmapp.te \
    latencytop.te \
    lcdc_screen_cap.te \
    libmnlp_mt6582.te \
    libperfservice_test.te \
    librank.te \
    linker.te \
    logcat.te \
    logwrapper.te \
    lsm303md.te \
    lua.te \
    magd.te \
    make_ext4fs.te \
    malloc_debug_test.te \
    matv.te \
    mc6420d.te \
    mdlogger.te \
    md_minilog_util.te \
    mdnsd.te \
    media.te \
    memorydumper.te \
    memsicd3416x.te \
    memsicd.te \
    meta_tst.te \
    met_cmd.te \
    mfv_ut.te \
    micro_bench_static.te \
    micro_bench.te \
    mke2fs.te \
    mlcmd.te \
    mmp.te \
    mnld.te \
    mobile_log_d.te \
    monkey.te \
    msensord.te \
    msr3110_dev_test.te \
    mtk_6620_launcher.te \
    mtk_6620_wmt_concurrency.te \
    mtk_6620_wmt_lpbk.te \
    mtk_agpsd.te \
    mtkbt.te \
    mtop.te \
    muxer.te \
    muxreport.te \
    nc.te \
    ndc.te \
    netcfg.te \
    netdiag.te \
    netperf.te \
    netserver.te \
    nfcstackp.te \
    nvram_agent_binder.te \
    nvram_daemon.te \
    omx_ut.te \
    opcontrol.te \
    oprofiled.te \
    orientationd.te \
    perf.te \
    permission_check.te \
    ping6.te \
    pm.te \
    pngtest.te \
    poad.te \
    pppd_dt.te \
    pq.te \
    procmem.te \
    procrank.te \
    qmc5983d.te \
    radiooptions.te \
    radvd.te \
    rawbu.te \
    record.te \
    recordvideo.te \
    recovery.te \
    requestsync.te \
    resize2fs.te \
    resmon.te \
    resmon_test.te \
    rildmd2.te \
    rtt.te \
    s62xd.te \
    sane_schedstat.te \
    schedtest.te \
    screencap.te \
    screenshot.te \
    sdiotool.te \
    selinux_network.te \
    SEMTK_policy_check.py \
    sensorservice.te \
    server_open_nfc.te \
    service.te \
    set_ext4_err_bit.te \
    settings.te \
    sf2.te \
    showmap.te \
    showslab.te \
    shutdown.te \
    skia_test.te \
    sn.te \
    sqlite3.te \
    stagefright.te \
    stb.te \
    strace.te \
    stream.te \
    stressTestBench.te \
    superumount.te \
    svc.te \
    tcpdump.te \
    tc.te \
    terservice.te \
    tertestclient.te \
    testid3.te \
    test_rild_porting.te \
    thermald.te \
    thermal_manager.te \
    thermal.te \
    timeinfo.te \
    tiny_mkswap.te \
    tiny_swapoff.te \
    tiny_swapon.te \
    tiny_switch.te \
    toolbox.te \
    tune2fs.te \
    uiautomator.te \
    uim_sysfs.te \
    updater.te \
    vdc.te \
    vtservice.te \
    wfd.te \
    wlan_loader.te \
    wm.te \
    wmt_loader.te \
    wpa_cli.te \
    xlog.te
