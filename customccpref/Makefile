ARCHS = arm64

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CustomCCPref
CustomCCPref_FILES = CCCRootListController.m
CustomCCPref_INSTALL_PATH = /Library/PreferenceBundles
CustomCCPref_FRAMEWORKS = UIKit
CustomCCPref_PRIVATE_FRAMEWORKS = Preferences
CustomCCPreferences_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/CustomCCPref.plist$(ECHO_END)
