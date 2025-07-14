#
# Copyright (C) The LineageOS Project
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

# Inherit from the common tree
$(call inherit-product, device/samsung/s5e8825-common/common.mk)

# Variant props
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/props/system/system_m346b.prop:$(TARGET_COPY_OUT_SYSTEM)/build_SM-M346B.prop \
    $(LOCAL_PATH)/configs/props/system/system_m346b2.prop:$(TARGET_COPY_OUT_SYSTEM)/build_SM-M346B2.prop \
    $(LOCAL_PATH)/configs/props/vendor/vendor_m346b.prop:$(TARGET_COPY_OUT_VENDOR)/build_SM-M346B.prop \
    $(LOCAL_PATH)/configs/props/vendor/vendor_m346b2.prop:$(TARGET_COPY_OUT_VENDOR)/build_SM-M346B2.prop \
    $(LOCAL_PATH)/configs/props/vendor_dlkm/vendor_dlkm_m346b.prop:$(TARGET_COPY_OUT_VENDOR_DLKM)/build_SM-M346B.prop \
    $(LOCAL_PATH)/configs/props/vendor_dlkm/vendor_dlkm_m346b2.prop:$(TARGET_COPY_OUT_VENDOR_DLKM)/build_SM-M346B2.prop \
    $(LOCAL_PATH)/configs/props/odm/odm_m346b.prop:$(TARGET_COPY_OUT_ODM)/build_SM-M346B.prop \
    $(LOCAL_PATH)/configs/props/odm/odm_m346b2.prop:$(TARGET_COPY_OUT_ODM)/build_SM-M346B2.prop \
    $(LOCAL_PATH)/configs/props/product/product_m346b.prop:$(TARGET_COPY_OUT_PRODUCT)/build_SM-M346B.prop \
    $(LOCAL_PATH)/configs/props/product/product_m346b2.prop:$(TARGET_COPY_OUT_PRODUCT)/build_SM-M346B2.prop \
    $(LOCAL_PATH)/configs/props/system_ext/system_ext_m346b.prop:$(TARGET_COPY_OUT_SYSTEM_EXT)/build_SM-M346B.prop \
    $(LOCAL_PATH)/configs/props/system_ext/system_ext_m346b2.prop:$(TARGET_COPY_OUT_SYSTEM_EXT)/build_SM-M346B2.prop

# Inherit proprietary files
$(call inherit-product, vendor/samsung/m34x/m34x-vendor.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

DEVICE_PATH := device/samsung/m34x

# Audio
PRODUCT_COPY_FILES += \
    $(foreach file,$(wildcard $(DEVICE_PATH)/configs/audio/*), \
        $(file):$(addprefix $(TARGET_COPY_OUT_VENDOR)/etc/, $(notdir $(file))) )

# Init
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/init/init.s5e8825.unify.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.s5e8825.unify.rc

# Nfc
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf

DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/configs/vintf/android.hardware.nfc@1.2-service.st.xml

PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service.st

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_ENFORCE_RRO_TARGETS += *

EMPTY_PLACEHOLDER := $(DEVICE_PATH)/configs/placeholder

# Placeholders
PRODUCT_COPY_FILES += \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/calliope_sram.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/mfc_fw.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/os.checked.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/NPU.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/vts.bin

# WiFi
PRODUCT_PACKAGES += \
    WifiOverlayM34X
