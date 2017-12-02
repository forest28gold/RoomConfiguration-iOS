//
//  NSObject+Property.h
//  Room Configuration
//
//  Created by AppsCreationTech on 11/18/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KeyValue <NSObject>

@optional

+ (NSDictionary *)objectClassInArray;

+ (NSDictionary *)replacedKeyFromPropertyName;

@end

@interface NSObject (Property) <KeyValue>

+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary;

@end
