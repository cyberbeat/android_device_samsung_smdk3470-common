LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := sensor_gpsd_shim.cpp
LOCAL_SHARED_LIBRARIES := libsensor libssl liblog
LOCAL_MODULE := libgpsd_shim
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)
