//
//  DesignModel.h
//  Room Configurator
//
//  Created by AppsCreationTech on 11/21/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DesignModel : NSObject

@property (nonatomic, copy) NSString *style;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *texture;
@property (nonatomic, assign) BOOL selectIsOn;

@end
