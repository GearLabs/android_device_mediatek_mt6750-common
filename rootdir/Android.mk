LOCAL_PATH:= $(call my-dir)

define add-rootdir-targets
$(foreach target,$(1), \
   $(eval include $(CLEAR_VARS)) \
   $(eval LOCAL_MODULE       := $(target)) \
   $(eval LOCAL_MODULE_CLASS := ETC) \
   $(eval LOCAL_SRC_FILES    := $(target)) \
   $(eval LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)) \
   $(eval include $(BUILD_PREBUILT)))
endef

$(call add-rootdir-targets, \
    fstab.mt6737 \
    init.mt6737.rc \
    init.mt6737.conn.rc \
    init.mt6737.modem.rc \
    init.mt6737.power.rc \
    init.mt6737.usb.rc \
    ueventd.mt6737.rc)
