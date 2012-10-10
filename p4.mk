# Copyright (C) 2011 The Android Open Source Project
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

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/dhd.ko:system/lib/modules/dhd.ko \
    $(LOCAL_PATH)/modules/cifs.ko:system/lib/modules/cifs.ko \
    $(LOCAL_PATH)/modules/ntfs.ko:system/lib/modules/ntfs.ko \
    $(LOCAL_PATH)/modules/md4.ko:system/lib/modules/md4.ko \
    $(LOCAL_PATH)/modules/nls_utf8.ko:system/lib/modules/nls_utf8.ko

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ril/cbd:root/sbin/cbd \
    $(LOCAL_PATH)/gps.xml:system/etc/gps.xml \
    $(LOCAL_PATH)/apns/apns-conf.xml:system/etc/apns-conf.xml

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product, device/samsung/p4-common/p4-common.mk)

$(call inherit-product-if-exists, vendor/samsung/p4/p4-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
  Mms

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
  ro.telephony.ril_class=Smdk4210RIL

# GPS config
PRODUCT_PROPERTY_OVERRIDES += \
  my.gps=novzw

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := p4
PRODUCT_DEVICE := p4
PRODUCT_MODEL := p4
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
