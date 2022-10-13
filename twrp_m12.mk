#
# Copyright (C) 2022 TeamWin Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from TWRP common configurations
$(call inherit-product, vendor/twrp/config/common.mk)

# Extra required packages.
PRODUCT_PACKAGES += \
    charger_res_images \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Copy rootdir files to recovery/root (output folder)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m12
PRODUCT_NAME := twrp_m12
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := Samsung Galaxy M12
PRODUCT_MANUFACTURER := Samsung