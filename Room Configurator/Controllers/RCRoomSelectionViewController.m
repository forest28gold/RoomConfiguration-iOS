//
//  RCRoomSelectionViewController.m
//  Room Configuration
//
//  Created by AppsCreationTech on 11/18/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "RCRoomSelectionViewController.h"
#import "RCMainViewController.h"

@interface RCRoomSelectionViewController ()

@end

@implementation RCRoomSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[GlobalData sharedGlobalData].g_autoFormat resizeView:self.view];
    self.m_btnRoom1.layer.borderWidth = 4.0f;
    self.m_btnRoom1.layer.borderColor = [UIColor colorWithHexString:@"008d66"].CGColor;
    self.m_btnRoom2.layer.borderWidth = 4.0f;
    self.m_btnRoom2.layer.borderColor = [UIColor colorWithHexString:@"008d66"].CGColor;
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

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSelectRoom1:(id)sender {
    
    [GlobalData sharedGlobalData].g_toggleRoomIsOn = true;
    
    RCMainViewController *nextCtrl = [[self storyboard]instantiateViewControllerWithIdentifier:VIEW_MAIN];
    [self.navigationController pushViewController:nextCtrl animated:true];
}

- (IBAction)onSelectRoom2:(id)sender {
    
    [GlobalData sharedGlobalData].g_toggleRoomIsOn = false;
    
    RCMainViewController *nextCtrl = [[self storyboard]instantiateViewControllerWithIdentifier:VIEW_MAIN];
    [self.navigationController pushViewController:nextCtrl animated:true];
}


@end
