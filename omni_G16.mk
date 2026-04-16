#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# 关键修改：继承 AOSP 基础配置，这是 TWRP minimal manifest 的标准做法
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# 继承设备特定的配置
$(call inherit-product, device/g16/G16/device.mk)

# 设备标识符
PRODUCT_DEVICE := G16
PRODUCT_NAME := omni_G16
PRODUCT_BRAND := G16
PRODUCT_MODEL := G16
PRODUCT_MANUFACTURER := g16
