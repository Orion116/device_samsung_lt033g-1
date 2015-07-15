#
# Copyright (C) 2013 The CyanogenMod Project
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

# Inherit from lt03-Common
$(call inherit-product, device/samsung/lt03-Common/lt03-Common.mk)

LOCAL_PATH := device/samsung/lt033g

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Audio
PRODUCT_PACKAGES += \
    audio.primary.universal5420 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    mixer_paths.xml \
    tinymix

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# idc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/sec_e-pen.idc:system/usr/idc/sec_e-pen.idc \
    $(LOCAL_PATH)/configs/idc/Synaptics_HID_TouchPad.idc:system/usr/idc/Synaptics_HID_TouchPad.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \

# Utilities
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/xbin/remount:system/xbin/remount \
    $(LOCAL_PATH)/prebuilt/etc/utils/optimizedb:system/etc/utils/optimizedb \
    $(LOCAL_PATH)/prebuilt/etc/utils/optimizestorage:system/etc/utils/optimizestorage

# Media profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml

PRODUCT_PACKAGES += \
    ueventd.universal5420.rc \
    init.carrier.rc

# Radio (needed for audio controls)
PRODUCT_PACKAGES += \
    cbd

PRODUCT_PACKAGES += \
    CellBroadcastReceiver

# adb has root
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    persist.sys.usb.config=mtp

# root access adb and apps
ADDITIONAL_BUILD_PROPERTIES += \
    persist.sys.root_access=3 \
    persist.adb.notify=0

# call the proprietary setup
$(call inherit-product-if-exists, vendor/samsung/lt033g/lt033g-vendor.mk)
