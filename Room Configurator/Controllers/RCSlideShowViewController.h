//
//  RCSlideShowViewController.h
//  Room Configurator
//
//  Created by AppsCreationTech on 11/19/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIPhotoGalleryView.h"

@interface RCSlideShowViewController : UIViewController <UIPhotoGalleryDataSource, UIPhotoGalleryDelegate>

@property (strong, nonatomic) IBOutlet UIButton *m_btnBack;

@property (strong, nonatomic) IBOutlet UILabel *m_lblImageName;
@property (strong, nonatomic) IBOutlet UIPhotoGalleryView *vPhotoGallery;
@property (strong, nonatomic) IBOutlet UIButton *m_btnSlideBack;
@property (strong, nonatomic) IBOutlet UIButton *m_btnSlideForward;

@end
