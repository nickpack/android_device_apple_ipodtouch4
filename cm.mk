# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := ipodtouch4

TARGET_BOOTANIMATION_NAME := vertical-540x960

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/apple/ipodtouch4/device_ipodtouch4.mk)

# Device naming
PRODUCT_DEVICE := ipodtouch4
PRODUCT_NAME := cm_ipodtouch4
PRODUCT_BRAND := apple
PRODUCT_MODEL := iPod Touch 4
PRODUCT_MANUFACTURER := Apple

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=apple_ipodtouch4 BUILD_FINGERPRINT=apple_europe/apple_ipodtouch4/ipodtouch4:4.0.3/IML74K/309896.3:user/release-keys PRIVATE_BUILD_DESC="3.32.401.3 CL309896 release-keys" BUILD_NUMBER=309896
