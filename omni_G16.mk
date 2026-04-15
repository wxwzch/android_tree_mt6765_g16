#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from G16 device
$(call inherit-product, device/g16/G16/device.mk)

# Inherit TWRP common configuration (instead of Omni's)
# $(call inherit-product, bootable/recovery/twrp_common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := G16
PRODUCT_NAME := omni_G16
PRODUCT_BRAND := G16
PRODUCT_MODEL := G16
PRODUCT_MANUFACTURER := g16
