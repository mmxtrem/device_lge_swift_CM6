# Copyright 2006 The Android Open Source Project
ifeq ($(TARGET_PROVIDES_LIBRIL),true)

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME), swift)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    ril.cpp \
    ril_event.cpp

LOCAL_SHARED_LIBRARIES := \
    libutils \
    libbinder \
    libcutils \
    libhardware_legacy

LOCAL_CFLAGS :=

LOCAL_MODULE:= libril

LOCAL_LDLIBS += -lpthread

include $(BUILD_SHARED_LIBRARY)

endif

endif #TARGET_PROVIDES_LIBRIL
