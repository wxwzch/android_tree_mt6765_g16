#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# 指定本地路径
LOCAL_PATH := device/g16/G16

# 继承核心的、最小的产品配置，这是TWRP构建的基础
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
# 继承TWRP的通用配置，定义恢复镜像的构建规则
$(call inherit-product, vendor/twrp/config/common.mk)

# 设备基本标识 (应与 omni_G16.mk 中定义的一致)
PRODUCT_DEVICE := G16
PRODUCT_NAME := twrp_G16
PRODUCT_BRAND := G16
PRODUCT_MODEL := G16
PRODUCT_MANUFACTURER := G16

# 标记为基于Eng的构建，启用调试功能
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_TYPE=eng

# --- A/B 分区系统配置 (您提供的部分) ---
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTATH_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true
# --- 结束 A/B 配置 ---

# --- Boot Control HAL (启动控制硬件抽象层) ---
# 动态HAL实现
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    bootctrl.mt6765

# 静态HAL库 (备用/传统方式，通常二选一，当前注释掉)
# PRODUCT_STATIC_BOOT_CONTROL_HAL := \
#    bootctrl.mt6765 \
#    libgptutils \
#    libz \
#    libcutils

# --- OTA 更新相关组件 ---
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# --- 核心系统工具包 (TWRP及恢复环境必需) ---
PRODUCT_PACKAGES += \
    twrp \
    busybox \
    toybox \
    strace \
    htop

# 文件系统工具
PRODUCT_PACKAGES += \
    e2fsck \
    resize2fs \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs

# Parted 和 GDisk (分区工具)
PRODUCT_PACKAGES += \
    parted \
    sgdisk

# --- MTK 平台标识与组件 ---
# 通知构建系统此设备使用联发科硬件
PRODUCT_PACKAGES += \
    mtkpd

# --- 系统属性重写 (针对恢复模式) ---
# 禁用启动动画以加快恢复模式启动
PRODUCT_SYSTEM_PROPERTIES += \
    debug.sf.nobootanimation=1

# --- 内核模块（如果恢复模式需要加载特定驱动） ---
# 示例：如果TWRP需要额外的文件系统或硬件支持
# PRODUCT_COPY_FILES += \
#     $(LOCAL_PATH)/recovery/root/vendor/lib/modules/example.ko:recovery/root/vendor/lib/modules/example.ko
