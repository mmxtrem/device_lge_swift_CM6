# Put en_US first in the list, to make it default.
PRODUCT_LOCALES := ru_RU mdpi

$(call inherit-product, build/target/product/full.mk)

# HAL libs and other system binaries
PRODUCT_PACKAGES += \
	libmm-omxcore \
	libOmxCore \
	bdaddr_read \
	hcitool \
	FM \
	brcm_patchram_plus \
	libril \
	hostap \
	sensors.swift \

PRODUCT_PACKAGES += flash_image dump_image erase_image e2fsck

# Live wallpaper packages
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	librs_jni \

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lg/swift/prebuilt/kernel/zImage
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel

# Board-specific init
PRODUCT_COPY_FILES += device/lg/swift/files/init.rc:root/init.rc
PRODUCT_COPY_FILES += device/lg/swift/files/init.swift.rc:root/init.swift.rc
PRODUCT_COPY_FILES += device/lg/swift/files/ueventd.rc:root/ueventd.rc
PRODUCT_COPY_FILES += device/lg/swift/files/ueventd.swift.rc:root/ueventd.swift.rc
PRODUCT_COPY_FILES += device/lg/swift/files/initlogo.rle:root/initlogo.rle

PRODUCT_COPY_FILES += \
    device/lg/swift/chargemode/chargerlogo:root/sbin/chargerlogo \
    device/lg/swift/chargemode/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
    device/lg/swift/chargemode/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
    device/lg/swift/chargemode/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
    device/lg/swift/chargemode/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
    device/lg/swift/chargemode/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
    device/lg/swift/chargemode/chargerimages/battery_bg_bk.rle:root/chargerimages/battery_bg_bk.rle \
    device/lg/swift/chargemode/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
    device/lg/swift/chargemode/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    device/lg/swift/chargemode/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    device/lg/swift/chargemode/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    device/lg/swift/chargemode/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    device/lg/swift/chargemode/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    device/lg/swift/chargemode/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    device/lg/swift/chargemode/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    device/lg/swift/chargemode/chargerimages/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \
    device/lg/swift/chargemode/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \

# доступные для разгона частоты
PRODUCT_COPY_FILES += device/lg/swift/files/scaling_available_frequencies:system/etc/scaling_available_frequencies

# hosts
PRODUCT_COPY_FILES += device/lg/swift/files/hosts:system/etc/hosts

PRODUCT_COPY_FILES += \
	device/lg/swift/files/01_qcomm_omx.cfg:system/etc/01_qcomm_omx.cfg \

## OMX proprietaries
PRODUCT_COPY_FILES += \
	device/lg/swift/proprietary/lib/omx/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
	device/lg/swift/proprietary/lib/omx/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
	device/lg/swift/proprietary/lib/omx/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
	device/lg/swift/proprietary/lib/omx/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
	device/lg/swift/proprietary/lib/omx/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \
	device/lg/swift/proprietary/lib/omx/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
	device/lg/swift/proprietary/lib/omx/libOmxAacDec.so:system/lib/libOmxAacDec.so \
	device/lg/swift/proprietary/lib/omx/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
	device/lg/swift/proprietary/lib/omx/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
	device/lg/swift/proprietary/lib/omx/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
	device/lg/swift/proprietary/lib/omx/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
	device/lg/swift/proprietary/lib/omx/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
	device/lg/swift/proprietary/lib/omx/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
	device/lg/swift/proprietary/lib/omx/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
	device/lg/swift/proprietary/lib/omx/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
	device/lg/swift/proprietary/lib/omx/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
	device/lg/swift/proprietary/lib/omx/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
#	device/lg/swift/proprietary/lib/omx/libmm-adspsvc.so:system/lib/libqcomm_omx.so \

# Audio 
PRODUCT_COPY_FILES += \
	device/lg/swift/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
	device/lg/swift/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv \
	device/lg/swift/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
	device/lg/swift/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
	device/lg/swift/proprietary/lib/omx/libaudioalsa.so:system/lib/libaudioalsa.so \
#	device/lg/swift/proprietary/lib/libaudio.so:system/lib/libaudio.so \
#	device/lg/swift/proprietary/lib/libaudio.so:obj/lib/libaudio.so \
#	device/lg/swift/proprietary/lib/libaudiopolicy.so:system/lib/libaudiopolicy.so \
#	device/lg/swift/proprietary/lib/libaudiopolicy.so:obj/lib/libaudiopolicy.so \

# Camera proprietaries
PRODUCT_COPY_FILES += \
	device/lg/swift/proprietary/lib/camera/liboemcamera.so:system/lib/liboemcamera.so \
	device/lg/swift/proprietary/lib/camera/libmmjpeg.so:system/lib/libmmjpeg.so \
	device/lg/swift/proprietary/lib/camera/libmmipl.so:system/lib/libmmipl.so \
	device/lg/swift/proprietary/lib/camera/libcamera.so:system/lib/libcamera.so \
	device/lg/swift/proprietary/lib/camera/libcamera.so:obj/lib/libcamera.so \
#	device/lg/swift/proprietary/lib/camera/libcameraservice.so:system/lib/libcameraservice.so \
#	device/lg/swift/proprietary/lib/camera/libcameraservice.so:obj/lib/libcameraservice.so \

PRODUCT_COPY_FILES += \
	device/lg/swift/prebuilt/apns-conf.xml:system/etc/apns-conf.xml \

# RIL
PRODUCT_COPY_FILES += \
	device/lg/swift/proprietary/lib/ril/libauth.so:system/lib/libauth.so \
	device/lg/swift/proprietary/lib/ril/libbcmwl.so:system/lib/libbcmwl.so \
	device/lg/swift/proprietary/lib/ril/libcm.so:system/lib/libcm.so \
	device/lg/swift/proprietary/lib/ril/libdiag.so:system/lib/libdiag.so \
	device/lg/swift/proprietary/lib/ril/libdll.so:system/lib/libdll.so \
	device/lg/swift/proprietary/lib/ril/libdsm.so:system/lib/libdsm.so \
	device/lg/swift/proprietary/lib/ril/libdss.so:system/lib/libdss.so \
	device/lg/swift/proprietary/lib/ril/libgsdi_exp.so:system/lib/libgsdi_exp.so \
	device/lg/swift/proprietary/lib/ril/libgstk_exp.so:system/lib/libgstk_exp.so \
	device/lg/swift/proprietary/lib/ril/libmmgsdilib.so:system/lib/libmmgsdilib.so \
	device/lg/swift/proprietary/lib/ril/libnv.so:system/lib/libnv.so \
	device/lg/swift/proprietary/lib/ril/liboem_rapi.so:system/lib/liboem_rapi.so \
	device/lg/swift/proprietary/lib/ril/liboncrpc.so:system/lib/liboncrpc.so \
	device/lg/swift/proprietary/lib/ril/libpbmlib.so:system/lib/libpbmlib.so \
	device/lg/swift/proprietary/lib/ril/libqmi.so:system/lib/libqmi.so \
	device/lg/swift/proprietary/lib/ril/libqueue.so:system/lib/libqueue.so \
	device/lg/swift/proprietary/lib/ril/libril_log.so:system/lib/libril_log.so \
	device/lg/swift/proprietary/lib/ril/libril-qc-1.so:system/lib/libril-qc-1.so \
	device/lg/swift/proprietary/lib/ril/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
	device/lg/swift/proprietary/lib/ril/libwms.so:system/lib/libwms.so \
	device/lg/swift/proprietary/lib/ril/libwmsts.so:system/lib/libwmsts.so \
	device/lg/swift/proprietary/lib/ril/liblgdrm.so:system/lib/liblgdrm.so \
	device/lg/swift/proprietary/lib/ril/liblgdrmwbxml.so:system/lib/liblgdrmwbxml.so \
	device/lg/swift/proprietary/lib/ril/liblgeat.so:system/lib/liblgeat.so \
	device/lg/swift/proprietary/lib/ril/liblgerft.so:system/lib/liblgerft.so \
#	device/lg/swift/proprietary/lib/ril/libril.so:system/lib/libril.so

# LGE services
PRODUCT_COPY_FILES += \
	device/lg/swift/proprietary/akmd2:system/bin/akmd2 \
	device/lg/swift/proprietary/qmuxd:system/bin/qmuxd \
	device/lg/swift/proprietary/adb.sh:system/bin/adb.sh \
	device/lg/swift/proprietary/ums.sh:system/bin/ums.sh \
	device/lg/swift/proprietary/rild:system/bin/rild

# GPS
PRODUCT_COPY_FILES += \
	device/lg/swift/files/loc_parameter.ini:system/etc/loc_parameter.ini \
	device/lg/swift/files/gps.conf:system/etc/gps.conf \
	device/lg/swift/proprietary/lib/gps/libcommondefs.so:system/lib/libcommondefs.so \
	device/lg/swift/proprietary/lib/gps/libgps.so:system/lib/libgps.so \
	device/lg/swift/proprietary/lib/gps/libloc_api.so:system/lib/libloc_api.so \
	device/lg/swift/proprietary/lib/gps/libloc-rpc.so:system/lib/libloc-rpc.so \
	device/lg/swift/proprietary/lib/gps/libloc.so:system/lib/libloc.so \
	device/lg/swift/proprietary/lib/gps/librpc.so:system/lib/librpc.so \
	device/lg/swift/proprietary/lib/gps/libloc_api.so:obj/lib/libloc_api.so \
	device/lg/swift/proprietary/lib/gps/libloc.so:obj/lib/libloc.so \
	device/lg/swift/proprietary/lib/gps/libloc-rpc.so:obj/lib/libloc-rpc.so \
	device/lg/swift/proprietary/lib/gps/libgps.so:obj/lib/libgps.so \
	device/lg/swift/proprietary/lib/gps/libcommondefs.so:obj/lib/libcommondefs.so \

# Bluetooth
PRODUCT_COPY_FILES += \
	device/lg/swift/proprietary/bluetooth/BCM4325D1_004.002.004.0262.0270.hcd:system/bin/BCM4325D1_004.002.004.0262.0270.hcd \
	device/lg/swift/proprietary/bluetooth/btld:system/bin/btld \
	device/lg/swift/proprietary/brcm_patchram_plus:system/bin/brcm_patchram_plus \

# Wifi
PRODUCT_COPY_FILES += \
	device/lg/swift/proprietary/wifi/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
	device/lg/swift/proprietary/wifi/nvram.txt:system/etc/wl/nvram.txt \
	device/lg/swift/prebuilt/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
	device/lg/swift/files/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/lg/swift/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf \
	device/lg/swift/proprietary/wifi/wpa_supplicant:system/bin/wpa_supplicant \
	device/lg/swift/proprietary/wifi/rtecdc.bin:system/etc/wl/rtecdc.bin \
	device/lg/swift/proprietary/wifi/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin \
	device/lg/swift/proprietary/wifi/wl:system/bin/wl \

PRODUCT_COPY_FILES += $(shell find device/lg/swift/prebuilt/kernel/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')

# Keylayouts
PRODUCT_COPY_FILES += \
	device/lg/swift/prebuilt/msm_touchscreen.kcm.bin:system/usr/keychars/msm_touchscreen.kcm.bin \
	device/lg/swift/prebuilt/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
	device/lg/swift/prebuilt/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
	device/lg/swift/prebuilt/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/lg/swift/prebuilt/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/lg/swift/prebuilt/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
	device/lg/swift/prebuilt/keylayout/7k_headset.kl:system/usr/keylayout/7k_headset.kl \

# SD Card
PRODUCT_COPY_FILES += \
	device/lg/swift/files/vold.fstab:/system/etc/vold.fstab \

# Hardware properties 
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# 2D
PRODUCT_COPY_FILES += \
	device/lg/swift/proprietary/lib/copybit.swift.so:system/lib/hw/copybit.swift.so \
	device/lg/swift/proprietary/lib/gralloc.swift.so:system/lib/hw/gralloc.swift.so \
	device/lg/swift/proprietary/lib/gralloc.default.so:system/lib/hw/gralloc.default.so \

# HW
PRODUCT_COPY_FILES += \
	device/lg/swift/proprietary/lib/lights.swift.so:system/lib/hw/lights.swift.so \
#	device/lg/swift/proprietary/lib/sensors.swift.so:system/lib/hw/sensors.swift.so \

# OpenGL
PRODUCT_COPY_FILES += \
	device/lg/swift/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
	device/lg/swift/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
	device/lg/swift/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
	device/lg/swift/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
	device/lg/swift/proprietary/lib/egl/libgsl.so:system/lib/libgsl.so \
	device/lg/swift/prebuilt/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
	device/lg/swift/prebuilt/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
	device/lg/swift/files/egl.cfg:system/lib/egl/egl.cfg \
	device/lg/swift/proprietary/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
	device/lg/swift/proprietary/lib/egl/libEGL.so:system/lib/libEGL.so \
	device/lg/swift/proprietary/lib/egl/libETC1.so:system/lib/libETC1.so \
	device/lg/swift/proprietary/lib/egl/libGLESv1_CM.so:system/lib/libGLESv1_CM.so \
	device/lg/swift/proprietary/lib/egl/libGLESv2.so:system/lib/libGLESv2.so \

PRODUCT_COPY_FILES += \
	device/lg/swift/files/06sdcardtune:system/etc/init.d/06sdcardtune \
	device/lg/swift/files/07swapon:system/etc/init.d/07swapon \

PRODUCT_PROPERTY_OVERRIDES += ro.product.model="LG-GT540"

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=Utopia-1.5-Final-24.03.2012 \

PRODUCT_MANUFACTURER := LGE
PRODUCT_BRAND := LGE
PRODUCT_NAME := full_swift
PRODUCT_DEVICE := swift
PRODUCT_MODEL := LG-GT540

    # use all present proprietary apk
    PRODUCT_COPY_FILES += $(shell find device/lg/swift/prebuilt/googleapps -name '*.apk' \
	-printf '%p:system/app/%f ')

    # use all present proprietary lib
    PRODUCT_COPY_FILES += $(shell find device/lg/swift/prebuilt/googleapps -name '*.so' \
	-printf '%p:system/lib/%f ')

    # use all present proprietary jar
    PRODUCT_COPY_FILES += $(shell find device/lg/swift/prebuilt/googleapps -name '*.jar' \
	-printf '%p:system/framework/%f ')

    # use all present proprietary xml (permissions)
    PRODUCT_COPY_FILES += $(shell find device/lg/swift/prebuilt/googleapps -name '*.xml' \
	-printf '%p:system/etc/permissions/%f ')

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_eu_supl.mk)
