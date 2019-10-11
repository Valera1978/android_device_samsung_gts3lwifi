# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from gts3lwifi device
$(call inherit-product, device/samsung/gts3lwifi/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_gts3lwifi
PRODUCT_DEVICE := gts3lwifi
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SM-T820
PRODUCT_MANUFACTURER := Samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="gts3lwifi" \
    PRODUCT_NAME="gts3lwifi" \
    PRIVATE_BUILD_DESC="gts3lwifixx-user 9 PPR1.180610.011 T820XXU3CSH9 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := "samsung/gts3lwifixx/gts3lwifi:9/PPR1.180610.011/T820XXU3CSH9:user/release-keys"

TARGET_VENDOR := Samsung
