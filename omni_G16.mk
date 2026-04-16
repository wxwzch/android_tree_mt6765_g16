#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# 按从最具体到最一般的顺序继承产品配置
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# 继承来自设备树的具体配置
$(call inherit-product, device/g16/G16/device.mk)

# 关键修改：继承 TWRP 通用配置，定义恢复镜像构建目标
$(call inherit-product, bootable/recovery/twrp.mk)

# 设备标识符。此部分必须位于所有 `inherit-product` 语句之后
PRODUCT_DEVICE := G16
PRODUCT_NAME := omni_G16
PRODUCT_BRAND := G16
PRODUCT_MODEL := G16
PRODUCT_MANUFACTURER := g16
