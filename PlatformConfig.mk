# Copyright 2014 The Android Open Source Project
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

# Platform path
PLATFORM_COMMON_PATH := device/sony/tone
PRODUCT_PLATFORM_SOD := true

TARGET_BOARD_PLATFORM := msm8996
KERNEL_PATH := kernel/sony/msm-4.4
TARGET_KERNEL_SOURCE := kernel/sony/msm-4.4/kernel

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := kryo

TARGET_USES_64_BIT_BINDER := true
TARGET_USES_64_BIT_BCMDHD := true

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

BOARD_KERNEL_CMDLINE += androidboot.bootdevice=7464900.sdhci

# Serial console
#BOARD_KERNEL_CMDLINE += earlycon=msm_serial_dm,0x075b0000

TARGET_RECOVERY_FSTAB ?= $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/fstab.tone

# Wi-Fi definitions for Broadcom solution
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"

# BT definitions for Broadcom solution
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_COMMON_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := $(PLATFORM_COMMON_PATH)/bluetooth/vnd_generic.txt

# RIL
TARGET_PER_MGR_ENABLED := true

# Lineage
WITHOUT_CHECK_API := true

# FPC version select
TARGET_FPC_VERSION := N

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm8996
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true
DEVICE_SPECIFIC_GPS_PATH := $(PLATFORM_COMMON_PATH)/gps

# Platform witout a vendor partition
TARGET_COPY_OUT_VENDOR := system/vendor

# SELinux
BOARD_SEPOLICY_DIRS += $(PLATFORM_COMMON_PATH)/sepolicy_platform

BOARD_ROOT_EXTRA_SYMLINKS := /system/vendor/lib/dsp:/dsp

include device/sony/common/CommonConfig.mk

# Inherit from the proprietary version
-include vendor/sony/tone/BoardConfigVendor.mk
