//
//  RCMainViewController.h
//  Room Configuration
//
//  Created by AppsCreationTech on 11/18/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLView.h"
#import "PLJSONLoader.h"

@interface RCMainViewController : UIViewController <PLViewDelegate, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) IBOutlet PLView *plView;

@property(nonatomic, strong) IBOutlet UIView *m_viewTitle;

@property(nonatomic, strong) IBOutlet UIView *m_viewMenu;
@property(nonatomic, strong) IBOutlet UIButton *m_btnDesign;
@property(nonatomic, strong) IBOutlet UIButton *m_btnGallery;
@property(nonatomic, strong) IBOutlet UIButton *m_btnSave;
@property(nonatomic, strong) IBOutlet UIButton *m_btnSettings;

@property (nonatomic, strong) IBOutlet UIView *m_viewDesign;
@property (strong, nonatomic) IBOutlet UIImageView *m_imgDown;
@property (strong, nonatomic) IBOutlet UIButton *m_btnDesignName;
@property (nonatomic, strong) IBOutlet UIView *m_viewDesignName;
@property (strong, nonatomic) IBOutlet UIView *m_viewNameList;
@property (strong, nonatomic) IBOutlet UITableView *m_tableViewDesign;

@property (strong, nonatomic) IBOutlet UIImageView *m_imgCatalogDown;
@property (strong, nonatomic) IBOutlet UIButton *m_btnCatalogName;
@property (nonatomic, strong) IBOutlet UIView *m_viewCatalogName;
@property (strong, nonatomic) IBOutlet UIView *m_viewCatalogList;
@property (strong, nonatomic) IBOutlet UITableView *m_tableViewCatalog;

@property (strong, nonatomic) IBOutlet UIButton *m_btnDesigns;
@property (strong, nonatomic) IBOutlet UIButton *m_btnSolidColors;

@property (strong, nonatomic) IBOutlet UICollectionView *m_collectionViewDesign;

@property (nonatomic, strong) IBOutlet UIView *m_viewGallery;
@property (strong, nonatomic) IBOutlet UIButton *m_btnAdd;
@property (strong, nonatomic) IBOutlet UITableView *m_tableViewGallery;
@property (strong, nonatomic) IBOutlet UICollectionView *m_collectionViewGallery;

@property (nonatomic, strong) IBOutlet UIView *m_viewOverlay;
@property (nonatomic, strong) IBOutlet UIView *m_viewNewFolder;
@property (nonatomic, strong) IBOutlet UITextField *m_txtName;
@property (nonatomic, strong) IBOutlet UIButton *m_btnCancel;
@property (nonatomic, strong) IBOutlet UIButton *m_btnSubmit;

@property(nonatomic, strong) IBOutlet UIView *m_viewSettings;
@property(nonatomic, strong) IBOutlet UIView *m_viewSettingsUpdate;
@property(nonatomic, strong) IBOutlet UIView *m_viewSettingsUpload;
@property(nonatomic, strong) IBOutlet UIView *m_viewSettingsTutorial;
@property(nonatomic, strong) IBOutlet UIView *m_viewSettingsReset;
@property(nonatomic, strong) IBOutlet UIView *m_viewSettingsDownload;
@property(nonatomic, strong) IBOutlet UIView *m_viewSettingsUserSettings;

@end
