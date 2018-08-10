#include "CCCRootListController.h"

//static NSUserDefaults *preferences = [[NSUserDefaults alloc] initWithSuiteName:@"com.leroy.CustomCCPreferences"];

@implementation CCCRootListController

#pragma mark - Constants

+ (NSString *)hb_specifierPlist {
	return @"Root";
}

+ (NSString *)hb_shareText {
	return @"Thanks for checking out my tweak! ";
}

+ (NSURL *)hb_shareURL {
	return [NSURL URLWithString:@"https://leroy-b.github.io/home/"];
}

#pragma mark - PSListController

- (void)viewDidLoad {
	[super viewDidLoad];

	HBAppearanceSettings *appearance = [[HBAppearanceSettings alloc] init];
	appearance.tintColor = [UIColor orangeColor];
	// appearance.navigationBarTintColor = [UIColor blackColor];
	// appearance.navigationBarBackgroundColor = [UIColor whiteColor];
	// appearance.navigationBarTitleColor = [UIColor blackColor];
	// appearance.statusBarTintColor = [UIColor blackColor];
	// appearance.tableViewCellTextColor = [UIColor blackColor];
	// appearance.tableViewCellBackgroundColor = [UIColor colorWithRed:229/255.f green:229/255.f blue:229/255.f alpha:1.0];
	// appearance.tableViewCellSeparatorColor = [UIColor grayColor];
	// appearance.tableViewCellSelectionColor = [UIColor colorWithRed:246/255.f green:239/255.f blue:239/255.f alpha:1.0];
	// appearance.tableViewBackgroundColor = [UIColor whiteColor];
	self.hb_appearanceSettings = appearance;
}

#pragma mark - Actions

- (void)doStuffTapped:(PSSpecifier *)specifier {
	PSTableCell *cell = [self cachedCellForSpecifier:specifier];
	cell.cellEnabled = NO;

	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		cell.cellEnabled = YES;
	});
}


@end
