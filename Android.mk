#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# WARNING: Everything listed here will be built on ALL platforms,
# including x86, the emulator, and the SDK.  Modules must be uniquely
# named (liblights.tuna), and must build everywhere, or limit themselves
# to only building on ARM if they include assembly. Individual makefiles
# are responsible for having their own logic, for fine-grained control.

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),gts3lwifi)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

MODEM_IMAGES := \
    modem.b00 modem.b01 modem.b02 modem.b03 modem.b04 \
    modem.b06 modem.b07 modem.b08 modem.b10 modem.b11 \
    modem.b12 modem.b13 modem.b14 modem.mdt

MODEM_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(MODEM_IMAGES)))
$(MODEM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "MODEM firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware-modem/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MODEM_SYMLINKS)

IMS_LIBS := libimscamera_jni.so libimsmedia_jni.so
IMS_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/app/ims/lib/arm64/,$(notdir $(IMS_LIBS)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "IMS lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(IMS_SYMLINKS)

WCNSS_INI_SYMLINK := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini
$(WCNSS_INI_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS config ini link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/etc/wifi/$(notdir $@) $@

WCNSS_MAC_SYMLINK := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/wlan_mac.bin
$(WCNSS_MAC_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS MAC bin link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /persist/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WCNSS_INI_SYMLINK) $(WCNSS_MAC_SYMLINK)

# Create links for audcal data files
$(shell mkdir -p $(TARGET_OUT_VENDOR)/etc/firmware/wcd9320; \
	ln -sf /data/misc/audio/wcd9320_anc.bin \
		$(TARGET_OUT)/etc/firmware/wcd9320/wcd9320_anc.bin;\
	ln -sf /data/misc/audio/mbhc.bin \
		$(TARGET_OUT)/etc/firmware/wcd9320/wcd9320_mbhc.bin; \
	ln -sf /data/misc/audio/wcd9320_mad_audio.bin \
		$(TARGET_OUT)/etc/firmware/wcd9320/wcd9320_mad_audio.bin)

RFS_MSM_ADSP_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/adsp/
$(RFS_MSM_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM ADSP folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware	

RFS_MSM_MPSS_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/mpss/
$(RFS_MSM_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM MPSS folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/modem $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/mpss $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware		

RFS_MSM_SLPI_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/slpi/
$(RFS_MSM_SLPI_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM SLPI folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/modem $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/slpi $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware

RFS_MDM_SPARROW_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/mdm/sparrow/
$(RFS_MDM_SPARROW_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MDM SPARROW folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/sparrow $@/ramdumps
	$(hide) ln -sf /persist/rfs/mdm/sparrow $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware	

RFS_APQ_GNSS_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/apq/gnss/
$(RFS_APQ_GNSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS APQ GNSS folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/modem $@/ramdumps
	$(hide) ln -sf /persist/rfs/apq/gnss $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware	

ALL_DEFAULT_INSTALLED_MODULES += \
    $(RFS_MSM_ADSP_SYMLINKS) \
    $(RFS_MSM_MPSS_SYMLINKS) \
    $(RFS_MSM_SLPI_SYMLINKS) \
    $(RFS_MDM_SPARROW_SYMLINKS) \
    $(RFS_APQ_GNSS_SYMLINKS)

ADSP_IMAGES := \
    adsp.b00 adsp.b01 adsp.b02 adsp.b03 adsp.b04 \
    adsp.b05 adsp.b06 adsp.b08 adsp.b09 adsp.mdt

ADSP_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(ADSP_IMAGES)))
$(ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "ADSP firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware-modem/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(ADSP_SYMLINKS)

MBA_IMAGES := mba.mbn

MBA_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(MBA_IMAGES)))
$(MBA_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "MBA firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware-modem/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MBA_SYMLINKS)


AUTHHAT_IMAGES := authhat.b00 authhat.b01 authhat.b02 authhat.b03 authhat.b04 authhat.b05 authhat.b06 authhat.mdt

AUTHHAT_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(AUTHHAT_IMAGES)))
$(AUTHHAT_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "AUTHHAT firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(AUTHHAT_SYMLINKS)

BDWLAN_IMAGES := \
    bdwlan30.b01 bdwlan30.b02 bdwlan30.b03 bdwlan30.b04 bdwlan30.b05 bdwlan30.b06 bdwlan30.b07 \
    bdwlan30.b08 bdwlan30.b09 bdwlan30.b0a bdwlan30.b0b bdwlan30.b0c bdwlan30.b0d bdwlan30.b0e \
    bdwlan30.b11 bdwlan30.b15 bdwlan30.b18 bdwlan30.b1c bdwlan30.bin

BDWLAN_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(BDWLAN_IMAGES)))
$(BDWLAN_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "BDWLAN firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(BDWLAN_SYMLINKS)

CPE_IMAGES := \
    cpe_9335.b08 cpe_9335.b09 cpe_9335.b11 cpe_9335.b14 cpe_9335.b16 \
    cpe_9335.b18 cpe_9335.b19 cpe_9335.b20 cpe_9335.b22 cpe_9335.b24 \
    cpe_9335.b26 cpe_9335.b28 cpe_9335.b29 cpe_9335.mdt

CPE_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(CPE_IMAGES)))
$(CPE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "CPE firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CPE_SYMLINKS)

CPPF_IMAGES := cppf.b00 cppf.b01 cppf.b02 cppf.b03 cppf.b04 cppf.b05 cppf.b06 cppf.mdt

CPPF_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(CPPF_IMAGES)))
$(CPPF_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "CPPF firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CPPF_SYMLINKS)

DATA_IMAGES := data.msc

DATA_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(DATA_IMAGES)))
$(DATA_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "DATA firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(DATA_SYMLINKS)

ADD_IMAGES := \
    dhsecapp.b00 dhsecapp.b01 dhsecapp.b02 dhsecapp.b03 dhsecapp.b04 dhsecapp.b05 dhsecapp.b06 dhsecapp.mdt \
    dmverity.b00 dmverity.b01 dmverity.b02 dmverity.b03 dmverity.b04 dmverity.b05 dmverity.b06 dmverity.mdt \
    dualfp.b00 dualfp.b01 dualfp.b02 dualfp.b03 dualfp.b04 dualfp.b05 dualfp.b06 dualfp.mdt \
    dxprdy.b00 dxprdy.b01 dxprdy.b02 dxprdy.b03 dxprdy.b04 dxprdy.b05 dxprdy.b06 dxprdy.mdt \
    esecomm.b00 esecomm.b01 esecomm.b02 esecomm.b03 esecomm.b04 esecomm.b05 esecomm.b06 esecomm.mdt \
    isdbtmm.b00 isdbtmm.b01 isdbtmm.b02 isdbtmm.b03 isdbtmm.b04 isdbtmm.b05 isdbtmm.b06 isdbtmm.mdt \
    lksecapp.b00 lksecapp.b01 lksecapp.b02 lksecapp.b03 lksecapp.b04 lksecapp.b05 lksecapp.b06 lksecapp.mdt \
    mldap.b00 mldap.b01 mldap.b02 mldap.b03 mldap.b04 mldap.b05 mldap.b06 mldap.mdt \
    mst.b00 mst.b01 mst.b02 mst.b03 mst.b04 mst.b05 mst.b06 mst.mdt \
    otp30.bin \
    prov.b00 prov.b01 prov.b02 prov.b03 prov.b04 prov.b05 prov.b06 prov.mdt \
    qmpsecap.b00 qmpsecap.b01 qmpsecap.b02 qmpsecap.b03 qmpsecap.b04 qmpsecap.b05 qmpsecap.b06 qmpsecap.mdt \
    qwlan30.bin \
    sdtvrmp.b00 sdtvrmp.b01 sdtvrmp.b02 sdtvrmp.b03 sdtvrmp.b04 sdtvrmp.b05 sdtvrmp.b06 sdtvrmp.mdt \
    securemm.b00 securemm.b01 securemm.b02 securemm.b03 securemm.b04 securemm.b05 securemm.b06 securemm.mdt \
    sem.b00 sem.b01 sem.b02 sem.b03 sem.b04 sem.b05 sem.b06 sem.mdt \
    skeymast.b00 skeymast.b01 skeymast.b02 skeymast.b03 skeymast.b04 skeymast.b05 skeymast.b06 skeymast.mdt \
    slpi.b00 slpi.b01 slpi.b02 slpi.b03 slpi.b04 slpi.b05 slpi.b06 slpi.b07 \
    slpi.b08 slpi.b09 slpi.b10 slpi.b11 slpi.b12 slpi.b13 slpi.b14 slpi.mdt \
    smplap32.b00 smplap32.b01 smplap32.b02 smplap32.b03 smplap32.b04 smplap32.b05 smplap32.b06 smplap32.mdt \
    smplap64.b00 smplap64.b01 smplap64.b02 smplap64.b03 smplap64.b04 smplap64.b05 smplap64.b06 smplap64.mdt \
    softsim.b00 softsim.b01 softsim.b02 softsim.b03 softsim.b04 softsim.b05 softsim.b06 softsim.mdt \
    tbase.b00 tbase.b01 tbase.b02 tbase.b03 tbase.b04 tbase.b05 tbase.b06 tbase.mdt \
    utf30.bin

ADD_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(ADD_IMAGES)))
$(ADD_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Additional firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(ADD_SYMLINKS)

FINGERPR_IMAGES := fingerpr.b00 fingerpr.b01 fingerpr.b02 fingerpr.b03 fingerpr.b04 fingerpr.b05 fingerpr.b06 fingerpr.mdt

FINGERPR_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(FINGERPR_IMAGES)))
$(FINGERPR_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "FINGERPR firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FINGERPR_SYMLINKS)

GPSTEST_IMAGES := gptest.b00 gptest.b01 gptest.b02 gptest.b03 gptest.b04 gptest.b05 gptest.b06 gptest.mdt

GPSTEST_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(GPSTEST_IMAGES)))
$(GPSTEST_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "GPSTEST firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(GPSTEST_SYMLINKS)

SKM_IMAGES := \
    skm.b00 skm.b01 skm.b02 skm.b03 skm.b04 skm.b05 skm.b06 skm.mdt \

SKM_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(SKM_IMAGES)))
$(SKM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "SKM firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(SKM_SYMLINKS)

SKMM_TA_IMAGES := \
    skmm_ta.b00 skmm_ta.b01 skmm_ta.b02 skmm_ta.b03 skmm_ta.b04 skmm_ta.b05 skmm_ta.b06 skmm_ta.mdt \

SKMM_TA_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(SKMM_TA_IMAGES)))
$(SKMM_TA_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "SKMM firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(SKMM_TA_SYMLINKS)

SSHDCPAP_IMAGES := \
    sshdcpap.b00 sshdcpap.b01 sshdcpap.b02 sshdcpap.b03 sshdcpap.b04 sshdcpap.b05 sshdcpap.b06 sshdcpap.mdt \

SSHDCPAP_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(SSHDCPAP_IMAGES)))
$(SSHDCPAP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "SSHDCPAP firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(SSHDCPAP_SYMLINKS)

TIMA_IMAGES := \
    tima_atn.b00 tima_atn.b01 tima_atn.b02 tima_atn.b03 tima_atn.b04 tima_atn.b05 tima_atn.b06 tima_atn.mdt \
    tima_key.b00 tima_key.b01 tima_key.b02 tima_key.b03 tima_key.b04 tima_key.b05 tima_key.b06 tima_key.mdt \
    tima_lkm.b00 tima_lkm.b01 tima_lkm.b02 tima_lkm.b03 tima_lkm.b04 tima_lkm.b05 tima_lkm.b06 tima_lkm.mdt \
    tima_pkm.b00 tima_pkm.b01 tima_pkm.b02 tima_pkm.b03 tima_pkm.b04 tima_pkm.b05 tima_pkm.b06 tima_pkm.mdt

TIMA_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(TIMA_IMAGES)))
$(TIMA_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "TIMA firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(TIMA_SYMLINKS)

TZ_IMAGES := \
    tz_ccm.b00 tz_ccm.b01 tz_ccm.b02 tz_ccm.b03 tz_ccm.b04 tz_ccm.b05 tz_ccm.b06 tz_ccm.mdt \
    tz_iccc.b00 tz_iccc.b01 tz_iccc.b02 tz_iccc.b03 tz_iccc.b04 tz_iccc.b05 tz_iccc.b06 tz_iccc.mdt \
    tz_otp.b00 tz_otp.b01 tz_otp.b02 tz_otp.b03 tz_otp.b04 tz_otp.b05 tz_otp.b06 tz_otp.mdt

TZ_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(TZ_IMAGES)))
$(TZ_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "TZ firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(TZ_SYMLINKS)

VENUS_IMAGES :=  venus.b00 venus.b01 venus.b02 venus.b03 venus.b04 venus.mdt

VENUS_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(VENUS_IMAGES)))
$(VENUS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Venus firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(VENUS_SYMLINKS)

WV_IMAGES := \
    cmnlib.b00 cmnlib.b01 cmnlib.b02 cmnlib.b03 cmnlib.b04 cmnlib.b05 cmnlib.mdt \
    cmnlib64.b00 cmnlib64.b01 cmnlib64.b02 cmnlib64.b03 cmnlib64.b04 cmnlib64.b05 cmnlib64.mdt \
    widevine.b00 widevine.b01 widevine.b02 widevine.b03 widevine.b04 widevine.b05 widevine.b06 widevine.mdt

WV_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(WV_IMAGES)))
$(WV_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Widevine firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WV_SYMLINKS)

WSM_IMAGES := wsm.b00 wsm.b01 wsm.b02 wsm.b03 wsm.b04 wsm.b05 wsm.b06 wsm.mdt

WSM_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(WSM_IMAGES)))
$(WSM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "WSM firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WSM_SYMLINKS)

endif