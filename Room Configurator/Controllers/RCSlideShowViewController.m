//
//  RCSlideShowViewController.m
//  Room Configurator
//
//  Created by AppsCreationTech on 11/19/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "RCSlideShowViewController.h"


@interface RCSlideShowViewController ()
{
    UIPhotoGalleryView *vPhotoGallery;
    NSArray *imgURLs;
    NSInteger initGalleryIndex;
}

@end

@implementation RCSlideShowViewController

@synthesize m_btnBack, m_btnSlideBack, m_btnSlideForward;
@synthesize vPhotoGallery, m_lblImageName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    imgURLs = @[
                   @"room01",
                   @"room02",
                   @"room03",
                   @"room01",
                   @"room02",
                   @"room03"
                   ];
    
    vPhotoGallery.dataSource = self;
    vPhotoGallery.delegate = self;
    
    vPhotoGallery.showsScrollIndicator = NO;
    vPhotoGallery.galleryMode = UIPhotoGalleryModeImageLocal; // UIPhotoGalleryModeImageRemote,  UIPhotoGalleryModeCustomView
    
    
    initGalleryIndex = 0;
    
    if (initGalleryIndex == 0) {
        [m_btnSlideBack setEnabled:false];
        [m_btnSlideForward setEnabled:true];
    } else if (initGalleryIndex == imgURLs.count-1) {
        [m_btnSlideBack setEnabled:true];
        [m_btnSlideForward setEnabled:false];
    }
    
    [[GlobalData sharedGlobalData].g_autoFormat resizeView:self.view];
    self.m_btnBack.layer.cornerRadius = 4.0f;
    
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(initSetGalleryView) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    vPhotoGallery.hidden = YES;
    [super viewWillDisappear:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma UIPhotoGalleryDataSource methods
- (NSInteger)numberOfViewsInPhotoGallery:(UIPhotoGalleryView *)photoGallery {
    return imgURLs.count;
}

- (UIImage*)photoGallery:(UIPhotoGalleryView *)photoGallery localImageAtIndex:(NSInteger)index {
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@", imgURLs[index]]];
}

- (NSURL*)photoGallery:(UIPhotoGalleryView *)photoGallery remoteImageURLAtIndex:(NSInteger)index {
    return nil;
}

- (UIView*)photoGallery:(UIPhotoGalleryView *)photoGallery customViewAtIndex:(NSInteger)index {
    return nil;
}

#pragma UIPhotoGalleryDelegate methods
- (void)photoGallery:(UIPhotoGalleryView *)photoGallery didTapAtIndex:(NSInteger)index {
    
}

- (void)photoGallery:(UIPhotoGalleryView *)photoGallery didMoveToIndex:(NSInteger)index {
    if (index == 0) {
        [m_btnSlideBack setEnabled:false];
        [m_btnSlideForward setEnabled:true];
    } else if (index == imgURLs.count-1) {
        [m_btnSlideBack setEnabled:true];
        [m_btnSlideForward setEnabled:false];
    } else {
        [m_btnSlideBack setEnabled:true];
        [m_btnSlideForward setEnabled:true];
    }
}

- (void)initSetGalleryView {
    [vPhotoGallery setInitialIndex:initGalleryIndex];
}

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSlideBack:(id)sender {
    [vPhotoGallery scrollToBesidePage:-1 animated:YES];
}

- (IBAction)onSlideForward:(id)sender {
    [vPhotoGallery scrollToBesidePage:1 animated:YES];
}

@end
