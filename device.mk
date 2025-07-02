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

# Inherit proprietary files
$(call inherit-product, vendor/samsung/m34x/m34x-vendor.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

DEVICE_PATH := device/samsung/m34x

# Audio
PRODUCT_COPY_FILES += \
    $(foreach file,$(wildcard $(DEVICE_PATH)/configs/audio/*), \
        $(file):$(addprefix $(TARGET_COPY_OUT_VENDOR)/etc/, $(notdir $(file))) )

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

# WiFi
PRODUCT_PACKAGES += \
    WifiOverlayM34X
