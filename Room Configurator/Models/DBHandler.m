//
//  DBHandler.m
//  Room Configuration
//
//  Created by AppsCreationTech on 11/18/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "DBHandler.h"


@implementation DBHandler

@synthesize dbHandler;

+ (id) connectDB {
	DBHandler *newInterface = [[DBHandler alloc] init];
	NSString* db_path = [documentPath stringByAppendingPathComponent:DB_NAME];
	int result = sqlite3_open([db_path UTF8String], &(newInterface->dbHandler));
	
	if (result != SQLITE_OK || ![DataModel createTable:newInterface->dbHandler]) {
//		[newInterface release];
		return nil;
	}
	return newInterface;
}

- (void) disconnectDB {
	sqlite3_close(dbHandler);
}

- (void)dealloc {
	[self disconnectDB];
//	[super dealloc];
}

@end
