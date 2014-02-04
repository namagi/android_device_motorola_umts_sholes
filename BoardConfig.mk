# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/motorola/umts_sholes/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := omap3

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_ARCH_VARIANT_FPU := neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8

ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_OMAP3 := true
COMMON_GLOBAL_CFLAGS += -DTARGET_OMAP3 -DOMAP_COMPAT -DMILESTONE_UIDS -DBINDER_COMPAT

TARGET_BOOTLOADER_BOARD_NAME := sholes

# Wifi related defines
BOARD_WLAN_DEVICE := wl1271
BOARD_SOFTAP_DEVICE := wl1271
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
WPA_SUPPLICANT_VERSION := VER_0_6_X
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_NAME := tiwlan_drv
WIFI_DRIVER_FW_STA_PATH := "/system/etc/wifi/fw_wlan1271.bin"
WIFI_FIRMWARE_LOADER := "wlan_loader"
PRODUCT_WIRELESS_TOOLS := true
AP_CONFIG_DRIVER_WILINK := true
WIFI_DRIVER_FW_AP_PATH := "/system/etc/wifi/fw_tiwlan_ap.bin"
WPA_SUPPL_APPROX_USE_RSSI := true
WPA_SUPPL_WITH_SIGNAL_POLL  := true
# CM9
WIFI_DRIVER_LOADER_DELAY := 200000
WIFI_AP_DRIVER_MODULE_PATH := "/system/lib/modules/tiap_drv.ko"
WIFI_AP_DRIVER_MODULE_NAME := tiap_drv
WIFI_AP_FIRMWARE_LOADER := wlan_ap_loader
WIFI_AP_DRIVER_MODULE_ARG := ""
BOARD_HOSTAPD_SERVICE_NAME  := hostap_netd
BOARD_HOSTAPD_NO_ENTROPY := true
BOARD_HOSTAPD_DRIVER := true
BOARD_HOSTAPD_DRIVER_NAME := wilink
BOARD_HOSTAPD_TIAP_ROOT := system/wlan/ti/WiLink_AP

BOARD_USES_GENERIC_AUDIO := false

# use pre-kernel.35 vold usb mounting
BOARD_USE_USB_MASS_STORAGE_SWITCH := true

USE_OPENGL_RENDERER := true
DEFAULT_FB_NUM := 0
BOARD_USES_OVERLAY := true
BOARD_USE_YUV422I_DEFAULT_COLORFORMAT := true

HARDWARE_OMX := true
TARGET_USE_OMAP_COMPAT  := true
TARGET_USE_OMX_RECOVERY := true
BUILD_WITH_TI_AUDIO := 1
BUILD_PV_VIDEO_ENCODERS := 1

BOARD_USES_CAMERASHIM := true
BOARD_CAMERA_LIBRARIES := libcamera
BOARD_CAMERA_MOTOROLA_COMPAT := true
BOARD_USE_FROYO_LIBCAMERA := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_EGL_CFG := device/motorola/umts_sholes/egl.cfg

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00380000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00480000
# real value:
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0afa0000
# here we lie about the system partition size so it can be used to max
# (squisher will change the size of files anyway)
# the size of system content in the final update zip package
# needs to be veryfied manually before flashing
# (considering also additional gapps size)!
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0e000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0c520000
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_SMALL_RECOVERY := true

TARGET_SKIA_USE_MORE_MEMORY := false

BOARD_WITHOUT_HW_COMPOSER := true

TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun0/file"

ENABLE_SENSORS_COMPAT := true
BOARD_USES_AUDIO_LEGACY := true
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USE_LEGACY_TOUCHSCREEN := true

# WITH_DEXPREOPT := true

# Custom releasetools
TARGET_CUSTOM_RELEASETOOL := ./device/motorola/umts_sholes/releasetools/squisher
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/motorola/umts_sholes/releasetools/umts_sholes_img_from_target_files
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/motorola/umts_sholes/releasetools/umts_sholes_ota_from_target_files

# Kernel
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
TARGET_KERNEL_SOURCE := $(ANDROID_BUILD_TOP)/kernel
TARGET_KERNEL_CONFIG := mapphone_2ndboot_defconfig

# Low mem
TARGET_ARCH_LOWMEM := true

