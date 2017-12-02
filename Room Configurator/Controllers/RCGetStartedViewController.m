//
//  RCGetStartedViewController.m
//  Room Configuration
//
//  Created by AppsCreationTech on 11/18/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "RCGetStartedViewController.h"
#import "RCRoomSelectionViewController.h"

@interface RCGetStartedViewController ()

@end

@implementation RCGetStartedViewController

@synthesize m_btnIndian, m_btnInternational;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[GlobalData sharedGlobalData].g_autoFormat resizeView:self.view];
    self.m_btnIndian.layer.cornerRadius = 3.0f;
    self.m_btnInternational.layer.cornerRadius = 3.0f;
    self.m_btnInternational.layer.borderWidth = 2.0f;
    self.m_btnInternational.layer.borderColor = [UIColor colorWithHexString:@"ffb90b"].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onIndianCatalog:(id)sender {
    
    [GlobalData sharedGlobalData].g_toggleIndianIsOn = true;
    
    RCRoomSelectionViewController *nextCtrl = [[self storyboard]instantiateViewControllerWithIdentifier:VIEW_ROOM_SELECTION];
    [self.navigationController pushViewController:nextCtrl animated:true];
}

- (IBAction)onInternationalCatalog:(id)sender {
    
    [GlobalData sharedGlobalData].g_toggleIndianIsOn = false;
    
    RCRoomSelectionViewController *nextCtrl = [[self storyboard]instantiateViewControllerWithIdentifier:VIEW_ROOM_SELECTION];
    [self.navigationController pushViewController:nextCtrl animated:true];
}

@end
