//
//  RCGallerySettingsViewController.m
//  Room Configurator
//
//  Created by AppsCreationTech on 11/19/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "RCGallerySettingsViewController.h"

@interface RCGallerySettingsViewController ()

@end

@implementation RCGallerySettingsViewController

@synthesize m_btnSettings, m_btnSave, m_imgDown, m_tableView, m_viewUpload, m_btnGalleryName, m_viewNameList;
@synthesize m_viewDownload, m_txtProfileName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    m_viewNameList.hidden = YES;
    m_btnSettings.hidden = YES;
    [m_btnGalleryName setTitle:@"Select Gallery Name" forState:UIControlStateNormal];
    
    m_imgDown.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_arrow = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapArrow)];
    [m_imgDown addGestureRecognizer:tap_arrow];
    
    UITapGestureRecognizer *tap_view = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onDismissDia)];
    [self.view addGestureRecognizer:tap_view];
    
    [[GlobalData sharedGlobalData].g_autoFormat resizeView:self.view];
    self.m_btnSave.layer.cornerRadius = 4.0f;
    self.m_viewUpload.layer.cornerRadius = 4.0f;
    self.m_viewDownload.layer.cornerRadius = 4.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)showDropMenuView:(UIView*)mView {
    
    if (!mView.hidden) {
        [self removeDropMenuView:mView];
    } else {
        mView.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
        mView.alpha = 0;
        mView.hidden = NO;
        [UIView animateWithDuration:.15 animations:^{
            mView.alpha = 1;
            mView.transform = CGAffineTransformMakeScale(1, 1);
            m_imgDown.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    }
}

- (void)removeDropMenuView:(UIView*)mView {
    
    [UIView animateWithDuration:.15 animations:^{
        mView.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
        mView.alpha = 0.0;
        m_imgDown.transform = CGAffineTransformMakeRotation(0);
    } completion:^(BOOL finished) {
        if (finished) {
            mView.hidden = YES;
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 30 * [GlobalData sharedGlobalData].g_autoFormat.SCALE_Y;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* _cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"GalleryNameCell" forIndexPath:indexPath];
    
    
    UIButton* m_btnName = (UIButton*)[_cell viewWithTag:1];
    
    [m_btnName setTitle:@"Gallery Name" forState:UIControlStateNormal];
    
    
    
    [m_btnName addTarget:self action:@selector(onSelectName:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView* _m_view = (UIView*)[_cell viewWithTag:10];
    if (_m_view.frame.size.width < self.m_tableView.frame.size.width) {
        [[GlobalData sharedGlobalData].g_autoFormat resizeView:_cell];
    }
    
    return _cell;
}

- (void)onSelectName:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    CGRect buttonFrameInTableView = [btn convertRect:btn.bounds toView:self.m_tableView];
    NSIndexPath *indexPath = [self.m_tableView indexPathForRowAtPoint:buttonFrameInTableView.origin];
    
    
    [m_btnGalleryName setTitle:@"Select Gallery Name" forState:UIControlStateNormal];
    
    [self removeDropMenuView:m_viewNameList];
}

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSave:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSettings:(id)sender {
    
}

- (void)onTapArrow {
    [self.view endEditing:YES];
    [self showDropMenuView:m_viewNameList];
}

- (void)onDismissDia {
    [self.view endEditing:YES];
    [self removeDropMenuView:m_viewNameList];
}

- (IBAction)onSetGalleryName:(id)sender {
    [self.view endEditing:YES];
    [self showDropMenuView:m_viewNameList];
}

- (IBAction)onUploadGallery:(id)sender {
    
    [self removeDropMenuView:m_viewNameList];
    
    
    
}

- (IBAction)onDownloadGallery:(id)sender {
    
    [self removeDropMenuView:m_viewNameList];
    
    
    
}

@end
