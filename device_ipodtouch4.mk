#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

DEVICE_PACKAGE_OVERLAYS += device/apple/ipodtouch4/overlay

# GPS and Light
PRODUCT_PACKAGES += \
    lights.ipodtouch4

# Torch
PRODUCT_PACKAGES += \
    Torch

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_EU:system/etc/gps.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    device/htc/msm8660-common/firmware/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd

# Wifi
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/apple/ipodtouch4/keychars/gpio-keys.kcm:system/usr/keychars/gpio-keys.kcm \
    device/apple/ipodtouch4/keylayout/headset.kl:system/usr/keylayout/headset.kl \
    device/apple/ipodtouch4/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

## misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_GB hdpi

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/apple/ipodtouch4/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/apple/ipodtouch4/modules/bcmdhd.ko:/system/lib/modules/bcmdhd.ko

$(call inherit-product-if-exists, vendor/idroidproject/s5l8930/s5l8930-vendor.mk)

$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)
