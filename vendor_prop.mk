# enable navigation bar
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.hw.mainkeys=1

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1 \
    audio.deep_buffer.media=true \
    audio.offload.buffer.size.kb=64 \
    audio.offload.video=true \
    audio_hal.period_size=192 \
    ro.qc.sdk.audio.fluencetype=none \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true \
    tunnel.audio.encode=false \
    audio.offload.pcm.16bit.enable=true \
    audio.offload.pcm.24bit.enable=true \
    audio.offload.track.enable=true \
    media.stagefright.audio.sink=280 \
    use.voice.path.for.pcm.voip=true \
    audio.offload.multiaac.enable=true \
    audio.dolby.ds2.enabled=true \
    audio.dolby.ds2.hardbypass=true \
    audio.offload.passthrough=true \
    audio.offload.multiple.enabled=false \
    ro.qc.sdk.audio.ssr=false \
    audio.offload.gapless.enabled=true \
    audio.safx.pbe.enabled=true \
    audio.parser.ip.buffer.size=262144 \
    ro.audio.monitorRotation=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=rome \
    ro.qualcomm.bluetooth.opp=true \
    ro.qualcomm.bluetooth.ftp=true \
    ro.qualcomm.bluetooth.nap=false \
    ro.bluetooth.sap=false \
    ro.bluetooth.dun=false \
    ro.qualcomm.bluetooth.hsp=false \
    ro.qualcomm.bluetooth.hfp=false \
    ro.qualcomm.bluetooth.pbap=true \
    ro.qualcomm.bluetooth.map=true

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.gyro.disable=0 \
    persist.camera.imglib.fddsp=1

# CNE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cne.feature=1

# Data modules
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.iwlan.enable=true \
    persist.data.mode=concurrent \
    persist.data.netmgrd.qos.enable=true \
    ro.use_data_netmgrd=true

# Display (Qualcomm AD)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qcom.ad=1 \
    ro.vendor.display.cabl=0

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

#property to enable fingerprint
PRODUCT_PROPERTY_OVERRIDES += \
    persist.qfp=false

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.egl.hw=1 \
    debug.sf.hw=1 \
    debug.sf.latch_unsignaled=1 \
    dev.pm.dyn_samplingrate=1 \
    persist.demo.hdmirotationlock=false \
    persist.hwc.enable_vds=1 \
    persist.sys.wfd.virtual=0 \
    ro.opengles.version=196610 \
    vendor.display.disable_rotator_split=1 \
    vendor.display.disable_skip_validate=1 \
    vendor.display.enable_default_color_mode=1 \
    vendor.display.perf_hint_window=50 \
    vendor.gralloc.enable_fb_ubwc=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
    lockscreen.rot_override=true

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.vidc.enc.disable.pq=true \
    vidc.enc.dcvs.extra-buff-count=2

# Memory optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.sys.fw.bservice_enable=true

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so \
    ro.vendor.qti.sys.fw.bg_apps_limit=60

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=yes

# WIFI model
PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only

# TimeService
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

# USB
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.controller=6a00000.dwc3

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0