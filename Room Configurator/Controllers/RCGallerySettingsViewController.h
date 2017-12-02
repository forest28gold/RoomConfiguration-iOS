//
//  RCGallerySettingsViewController.h
//  Room Configurator
//
//  Created by AppsCreationTech on 11/19/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCGallerySettingsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *m_btnSave;
@property (strong, nonatomic) IBOutlet UIButton *m_btnSettings;
@property (strong, nonatomic) IBOutlet UIImageView *m_imgDown;
@property (strong, nonatomic) IBOutlet UIButton *m_btnGalleryName;
@property (strong, nonatomic) IBOutlet UIView *m_viewNameList;
@property (strong, nonatomic) IBOutlet UITableView *m_tableView;
@property (strong, nonatomic) IBOutlet UITextField *m_txtProfileName;
@property (strong, nonatomic) IBOutlet UIView *m_viewUpload;
@property (strong, nonatomic) IBOutlet UIView *m_viewDownload;

@end
