//
//  DBHandler.h
//  Room Configuration
//
//  Created by AppsCreationTech on 11/18/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

#define DB_NAME					@"abvrtridentroomconfiguration.db"
#define documentPath			[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

@interface DBHandler : NSObject {
@public
	sqlite3 *dbHandler;
}

@property(nonatomic, getter=getDbHandler) sqlite3 *dbHandler;

+ (id)connectDB;
- (void)disconnectDB;

@end
