#import <Preferences/PSListController.h>

static NSUserDefaults *preferences;

static NSDictionary *customPositionSettings;
static NSDictionary *positionSettings;
static NSString *folderID;

static void setSetting(id value, NSString * specifierID) {

    NSMutableDictionary *mutableCustomPositionSettings = [customPositionSettings mutableCopy];
    NSMutableDictionary *mutablePositionSettings = [positionSettings mutableCopy];
    if(!mutablePositionSettings) {
      mutablePositionSettings = [NSMutableDictionary new];
    }
    if(!mutableCustomPositionSettings) {
      mutableCustomPositionSettings = [NSMutableDictionary new];
    }


    [mutablePositionSettings setObject:value forKey:specifierID];
    [mutableCustomPositionSettings setObject:mutablePositionSettings forKey:folderID];

    preferences = [[NSUserDefaults alloc] initWithSuiteName:@"com.leroy.CustomCCPreferences"];
    [preferences setObject:mutableCustomPositionSettings forKey:@"customPositionSettings"];
    [preferences synchronize];


    CFStringRef toPost = (CFStringRef)@"com.leroy.CustomCCPreferences/preferencesChanged"; //(CFStringRef)specifier.properties[@"PostNotification"];
    if(toPost) {
      CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), toPost, NULL, NULL, YES);
    }

    customPositionSettings = [mutableCustomPositionSettings copy];
    positionSettings = [mutablePositionSettings copy];

}

@implementation CCCPositionListController

  -(void)getCustomPositionSettings {
    preferences = [[NSUserDefaults alloc] initWithSuiteName:@"com.leroy.CustomCCPreferences"];
    customPositionSettings = [[preferences dictionaryForKey:@"customPositionSettings"] retain];
  }


  -(NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"customPositionSettings" target:self] retain];
    }
    return _specifiers;
  }

  -(id)readPreferenceValue:(PSSpecifier*)specifier {
      return positionSettings[specifier.identifier];
  }

  -(void)setValuePreference:(id)value forSpecifier:(PSSpecifier*)specifier {
      setSetting(value, specifier.identifier);
  }

  -(void)viewWillAppear:(BOOL)animated {
      [super viewWillAppear:animated];

      [self getCustomPositionSettings];

      UITableView *tableView = self.table;
      [tableView reloadData];
  }

@end
