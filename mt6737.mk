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
#

COMMON_PATH := device/mediatek/mt6737-common

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

# Root
PRODUCT_PACKAGES += \
    fstab.mt6735 \
    init.mt6735.rc \
    init.mt6735.modem.rc \
    init.mt6735.usb.rc \
    ueventd.mt6735.rc

# Recovery Ramdisk
PRODUCT_PACKAGES += \
    init.recovery.mt6735.rc

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(COMMON_PATH)/recovery/sbin/fuelgauged_static:recovery/root/sbin/fuelgauged_static

ifneq ($(TARGET_BUILD_VARIANT), user)
# ADB Debugging
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    ro.secure=0
endif

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudiopolicymanagerdefault \
    libtinyalsa \
    libtinycompress \
    libtinymix \
    libtinyxml

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(COMMON_PATH)/configs/audio_device.xml:system/etc/audio_device.xml \
    $(COMMON_PATH)/configs/audio_em.xml:system/etc/audio_em.xml

# Camera
PRODUCT_PACKAGES += \
    Snap

# Display
PRODUCT_PACKAGES += \
    libion

# FM
PRODUCT_PACKAGES += \
    libfmjni \
    FMRadio

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/prebuilts/proprietary/wileyfox/porridge/lib/hw/radio.fm.mt6735.so:system/lib/hw/radio.fm.mt6755.so

# GPS
$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_PACKAGES += \
    libcurl

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml \
    $(COMMON_PATH)/configs/slp_conf:system/etc/slp_conf

# Mediatek platform
PRODUCT_PACKAGES += \
    libmtk_symbols

# Power
PRODUCT_PACKAGES += \
    power.default \
    power.mt6737m

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml \
    $(COMMON_PATH)/prebuilts/proprietary/wileyfox/porridge/bin/mtkrild:system/bin/mtkrild \
    $(COMMON_PATH)/prebuilts/proprietary/wileyfox/porridge/lib/libmal.so:system/lib/libmal.so \
    $(COMMON_PATH)/prebuilts/proprietary/wileyfox/porridge/lib64/libmal.so:system/lib64/libmal.so \
    $(COMMON_PATH)/prebuilts/proprietary/wileyfox/porridge/lib/libmdfx.so:system/lib/libmdfx.so \
    $(COMMON_PATH)/prebuilts/proprietary/wileyfox/porridge/lib64/libmdfx.so:system/lib64/libmdfx.so \
    $(COMMON_PATH)/prebuilts/proprietary/wileyfox/porridge/lib/librilmtk.so:system/lib/librilmtk.so \
    $(COMMON_PATH)/prebuilts/proprietary/wileyfox/porridge/lib64/librilmtk.so:system/lib64/librilmtk.so \
    $(COMMON_PATH)/prebuilts/proprietary/wileyfox/porridge/lib/mtk-ril.so:system/lib/mtk-ril.so \
    $(COMMON_PATH)/prebuilts/proprietary/wileyfox/porridge/lib64/mtk-ril.so:system/lib64/mtk-ril.so

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    libwpa_client \
    wpa_supplicant \

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(COMMON_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(COMMON_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Charger Mode
PRODUCT_PACKAGES += \
    charger_res_images

# Key Layouts
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/keylayouts/ACCDET.kl:system/usr/keylayout/ACCDET.kl \
    $(COMMON_PATH)/keylayouts/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    $(COMMON_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_PATH)/configs/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml \
    $(COMMON_PATH)/configs/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
    $(COMMON_PATH)/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg
