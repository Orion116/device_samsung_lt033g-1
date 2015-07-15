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
-include device/samsung/lt03-Common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/lt033g

# inherit from the proprietary version
-include vendor/samsung/lt033g/BoardConfigVendor.mk

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := $(LOCAL_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Bootloader
TARGET_OTA_ASSERT_DEVICE := lt033g,lt03wifi,lt03wifiue

# Kernel
TARGET_KERNEL_CONFIG := cyanogenmod_lt033g_defconfig

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Audio
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER := true

# SurfaceFlinger
BOARD_USES_SYNC_MODE_FOR_MEDIA := true

# Modem
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6262
BOARD_RIL_CLASS := ../../../device/samsung/lt033g/ril
# we need define it (because audio.primary.universal5420.so requires it)
COMMON_GLOBAL_CFLAGS += -DSEC_PRODUCT_FEATURE_RIL_CALL_DUALMODE_CDMAGSM

# SELinux
include device/samsung/lt03-common/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += \
    device/samsung/lt033g/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    device.te \
    file.te \
    rild.te \
