#include "CCCRootListController.h"

//static NSUserDefaults *preferences = [[NSUserDefaults alloc] initWithSuiteName:@"com.leroy.CustomCCPreferences"];

@implementation CCCRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
		//Class DisplayController = %c(PSUIDisplayController);
	}

	return _specifiers;
}

@end
