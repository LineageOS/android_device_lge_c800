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

PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_COPY_FILES += \
    device/lge/c800/init.lgc800.rc:root/init.lgc800.rc \
    device/lge/c800/init.lgc800.usb.rc:root/init.lgc800.usb.rc \
    device/lge/c800/ueventd.lgc800.rc:root/ueventd.lgc800.rc

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.camera=msm7630 \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r6 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.bt.bdaddr_path=/data/misc/bd_addr

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Configure the qcom surface compositor
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=dyn \
    debug.enabletr=true

# Set default USB interface 
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp 

# Set default USB interface for first boot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

DEVICE_PACKAGE_OVERLAYS += device/lge/c800/overlay

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/lge/c800/configs/spn-conf.xml:system/etc/spn-conf.xml \
    device/lge/c800/configs/voicemail-conf.xml:system/etc/voicemail-conf.xml

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    libaudioutils

# Display
PRODUCT_PACKAGES += \
    copybit.msm7x30 \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libtilerenderer

# Media
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libOmxCore \
    libOmxVdec \
    libOmxVenc

# Sensors, GPS, Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    gps.lgc800 \
    lights.lgc800 \
    sensors.default

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
    PRODUCT_PACKAGES += send_bug
    PRODUCT_COPY_FILES += \
        system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
        system/extras/bugmailer/send_bug:system/bin/send_bug
endif

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/lge/c800/idc/qt602240_ts_input.idc:system/usr/idc/atcmd_virtual_kbd.idc \
    device/lge/c800/idc/qt602240_ts_input.idc:system/usr/idc/gpio-sidekey-device.idc \
    device/lge/c800/idc/qt602240_ts_input.idc:system/usr/idc/univa_q-keypad.idc \
    device/lge/c800/idc/qt602240_ts_input.idc:system/usr/idc/qt602240_ts_input.idc 


# Keychars
PRODUCT_COPY_FILES += \
    device/lge/c800/keychars/7k_handset.kcm.bin:system/usr/keychars/7k_handset.kcm.bin \
    device/lge/c800/keychars/atcmd_virtual_kbd.kcm.bin:system/usr/keychars/atcmd_virtual_kbd.kcm.bin \
    device/lge/c800/keychars/gpio-sidekey-device.kcm.bin:system/usr/keychars/gpio-sidekey-device.kcm.bin \
    device/lge/c800/keychars/univa_q-keypad.kcm.bin:system/usr/keychars/univa_q-keypad.kcm.bin

# Keylayouts
PRODUCT_COPY_FILES += \
    device/lge/c800/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/lge/c800/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/lge/c800/keylayout/atcmd_virtual_kbd.kl:system/usr/keylayout/atcmd_virtual_kbd.kl \
    device/lge/c800/keylayout/gpio-sidekey-device.kl:system/usr/keylayout/gpio-sidekey-device.kl \
    device/lge/c800/keylayout/univa_q-keypad.kl:system/usr/keylayout/univa_q-keypad.kl 

# BT/Wifi
PRODUCT_COPY_FILES += \
    device/lge/c800/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

PRODUCT_PACKAGES += \
    hwaddrs.lgc800 \
    hcitool

# The splashscreen
PRODUCT_COPY_FILES += \
    device/lge/c800/recovery/rmt_storage/rmt_storage:/root/sbin/rmt_storage \
    device/lge/c800/misc/wallpaper:/root/sbin/wallpaper \
    device/lge/c800/misc/initlogo.rle:root/initlogo.rle 

# Offmode charging
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# config files
PRODUCT_COPY_FILES += \
    device/lge/c800/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/lge/c800/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    device/lge/c800/configs/vold.fstab:system/etc/vold.fstab

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

#BOARD_WLAN_DEVICE_REV := bcm4330_b1
#WIFI_BAND             := 802_11_ABG
#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US:system/etc/gps.conf

# Inherit non-open-source blobs.
$(call inherit-product-if-exists, vendor/lge/c800/device-vendor.mk)

PRODUCT_COPY_FILES += \
    device/lge/c800/prebuilt/wireless.ko:system/lib/modules/wireless.ko

