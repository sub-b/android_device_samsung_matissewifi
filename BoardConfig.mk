#
# Copyright (rc4) 2014 The CyanogenMod Project
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

# inherit from common msm8226-common
-include device/samsung/msm8226-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/matissewifi

# Assert
TARGET_OTA_ASSERT_DEVICE := matissewifi,matisselte,matisse3g

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/matissewifi
TARGET_KERNEL_CONFIG := msm8226-sec_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8226-sec_matissewifi_defconfig
BOARD_KERNEL_CMDLINE := console=null androidboot.console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x1e00000
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_matissewifi.c
TARGET_UNIFIED_DEVICE := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 1024
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x02A7DEA0
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1866465280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5555010560
TARGET_USERIMAGES_USE_EXT4 := true

# Radio
BOARD_RIL_CLASS := ../../../device/samsung/matissewifi/ril/

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/matissewifi/

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/recovery.fstab

#TWRP
#RECOVERY_VARIANT=twrp
DEVICE_RESOLUTION := 1280x800
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 126
TW_IGNORE_MAJOR_AXIS_0 := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_USB_STORAGE := true
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
HAVE_SELINUX := true
#TW_INCLUDE_L_CRYPTO := true

PRODUCT_COPY_FILES := device/samsung/matissewifi/rootdir/etc/twrp.fstab:recovery/root/etc/twrp.fstab

# MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/samsung/matissewifi/multirom/mr_init_devices.c
MR_DPI := hdpi
MR_DPI_FONT := 160
MR_FSTAB := device/samsung/matissewifi/rootdir/etc/twrp.fstab
MR_KEXEC_MEM_MIN := 0x05000000
#MR_USE_MROM_FSTAB := true
#MR_DEVICE_HOOKS := device/samsung/matissewifi/multirom/mr_hooks.c
#MR_DEVICE_HOOKS_VER := 1
MR_KEXEC_DTB := true
#MR_INFOS := device/samsung/matissewifi/mrom_infos
MR_CONTINUOUS_FB_UPDATE := true

#ifeq ($(TARGET_BUILD_VARIANT), eng)
#  BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/customrecoveryimg.mk
#endif

# inherit from the proprietary version
-include vendor/samsung/matissewifi/BoardConfigVendor.mk
