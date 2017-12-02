//
//  GlobalData.h
//  Room Configuration
//
//  Created by AppsCreationTech on 11/18/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "DataModel.h"
#import "DBHandler.h"
#import "AutoFormatter.h"
#import "UserData.h"


@interface GlobalData : NSObject

@property (nonatomic, retain) AppDelegate                   *g_appDelegate;
@property (nonatomic, retain) DBHandler                     *g_dBHandler;
@property (nonatomic, retain) DataModel                     *g_dataModel;
@property (nonatomic, retain) AutoFormatter                 *g_autoFormat;
@property (nonatomic, retain) UserData                      *g_userInfo;

@property (nonatomic, assign) BOOL                          g_toggleIndianIsOn;
@property (nonatomic, assign) BOOL                          g_toggleRoomIsOn;


@property (strong, nonatomic) NSMutableArray                *g_arrayTermsUse;
@property (strong, nonatomic) NSString                      *g_strRecordFileName;
@property (nonatomic, assign) int                           g_spentDays;


+ (GlobalData*)sharedGlobalData;

- (BOOL) checkingVaildateEmailWithString:(NSString *)strEmail;
- (NSString *) trimString:(NSString *)string;
- (NSDate *)dateFromString:(NSString *)strDate DateFormat:(NSString *)strDateFormat TimeZone:(NSTimeZone *)timeZone;
- (void) saveToUserDefaultsWithValue:(id)value Key:(NSString *)strKey;
- (id) userDefaultWithKey:(NSString *)strKey;
- (void) removeValueFromUserDefaults:(NSString *)strKey;

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIColor *)colorWithHexString:(NSString *)colorString;

- (NSString*)getCurrentDate;
- (void)onErrorAlert:(NSString*)errorString;
//- (void)updateUserDataDB;

@end
