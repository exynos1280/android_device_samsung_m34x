#
# Copyright (C) The LineageOS Project
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
#

## Inherit from generic products, most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

## Inherit from m34x device
$(call inherit-product, device/samsung/m34x/device.mk)

## Boot Animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

## Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

## Device identifier, this must come after all inclusions
PRODUCT_DEVICE := m34x
PRODUCT_NAME := lineage_m34x
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-M346B
PRODUCT_MANUFACTURER := samsung
PRODUCT_SHIPPING_API_LEVEL := 34

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="m34xjxx-user 14 UP1A.231005.007 M346B2XUU7CXL1 release-keys" \
    BuildFingerprint=samsung/m34xjxx/essi:14/UP1A.231005.007/M346B2XUU7CXL1:user/release-keys \
    DeviceProduct=m34xjxx \
    SystemName=m34xjxx
