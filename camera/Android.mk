LOCAL_PATH := $(call my-dir)

PROPRIETARY_PATH := ../../../../vendor/samsung/$(TARGET_DEVICE)/proprietary

# Camera HAL Wrapper
# Disabled: camera.universal3470 is now built as a native HAL3
# implementation from hardware/samsung_slsi-cm/exynos3470/libcamera2_g800f.
# The wrapper module below only remains as a reference for the HAL1 blob.
#include $(CLEAR_VARS)
#
#LOCAL_C_INCLUDES := \
#    framework/native/include \
#    system/media/camera/include
#
#LOCAL_SRC_FILES := \
#    CameraWrapper.cpp
#
#LOCAL_STATIC_LIBRARIES := libarect
#LOCAL_SHARED_LIBRARIES := \
#    libhardware liblog libcamera_client libgui libui \
#    libhidltransport libutils android.hidl.token@1.0-utils
#
#LOCAL_HEADER_LIBRARIES := libnativebase_headers
#
#LOCAL_MODULE := camera.universal3470
#LOCAL_MODULE_RELATIVE_PATH := hw
#LOCAL_MODULE_TAGS := optional
#LOCAL_PROPRIETARY_MODULE := true
#
#include $(BUILD_SHARED_LIBRARY)

# Stock Camera HAL
include $(CLEAR_VARS)

LOCAL_MODULE		:= camera.vendor.universal3470
LOCAL_MODULE_SUFFIX 	:= .so
LOCAL_SRC_FILES		:= $(PROPRIETARY_PATH)/lib/hw/camera.universal3470.so
LOCAL_MODULE_CLASS 	:= SHARED_LIBRARIES
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS	:= optional
LOCAL_PROPRIETARY_MODULE := true

include $(BUILD_PREBUILT)
