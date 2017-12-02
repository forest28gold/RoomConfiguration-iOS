//
//  ViewController.h
//  Room Configurator
//
//  Created by AppsCreationTech on 11/17/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLView.h"
#import "PLJSONLoader.h"

@interface ViewController : UIViewController <PLViewDelegate>

@property(nonatomic, strong) IBOutlet PLView *plView;

@end

