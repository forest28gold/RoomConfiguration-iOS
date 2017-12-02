//
//  ViewController.m
//  Room Configurator
//
//  Created by AppsCreationTech on 11/17/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "ViewController.h"
#define kIdMin 1
#define kIdMax 1000

@interface ViewController ()
{
    NSObject<PLIPanorama> *panorama;
    PLHotspot *hotspotFloor;
    PLHotspot *hotspotWall;
    PLHotspot *hotspotCurtains;
    
    Boolean toggleWallIsOn, toggleFloorIsOn, toggleCurtainsIsOn;
}

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    toggleWallIsOn = false, toggleFloorIsOn = false, toggleCurtainsIsOn = false;
    
    PLTexture *hotspotFloorTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"empty" ofType:@"png"]]];
    hotspotFloor = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotFloorTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
    
    PLTexture *hotspotCurtainsTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"empty" ofType:@"png"]]];
    hotspotCurtains = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotCurtainsTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
    
    PLTexture *hotspotWallTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"empty" ofType:@"png"]]];
    hotspotWall = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotWallTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
    
    self.plView.delegate = self;
    panorama = [PLSphericalPanorama panorama];
    [(PLSphericalPanorama *)panorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"room_pano01" ofType:@"jpg"]]]];
    
    [panorama addHotspot:hotspotFloor];
    [panorama addHotspot:hotspotCurtains];
    [panorama addHotspot:hotspotWall];
    
    [self.plView setPanorama:panorama];
    
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(initSetPLView) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)initSetPLView {
    
    toggleCurtainsIsOn = true;
    PLTexture *hotspotCurtainsTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"curtains" ofType:@"png"]]];
    hotspotCurtains = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotCurtainsTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
    [panorama addHotspot:hotspotCurtains];
    
}

-(IBAction)onSetCurtains:(id)sender
{
    if (toggleCurtainsIsOn) {
        toggleCurtainsIsOn = false;
        [panorama removeHotspot:hotspotCurtains];
    } else {
        toggleCurtainsIsOn = true;
        PLTexture *hotspotCurtainsTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"curtains" ofType:@"png"]]];
        hotspotCurtains = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotCurtainsTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
        [panorama addHotspot:hotspotCurtains];
    }
}

-(IBAction)onSetWall:(id)sender
{
    if (toggleWallIsOn) {
        toggleWallIsOn = false;
        [panorama removeHotspot:hotspotWall];
    } else {
        toggleWallIsOn = true;
        PLTexture *hotspotWallTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"wall" ofType:@"png"]]];
        hotspotWall = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotWallTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
        [panorama addHotspot:hotspotWall];
    }
}

-(IBAction)onSetFloor:(id)sender
{
    if (toggleFloorIsOn) {
        toggleFloorIsOn = false;
        [panorama removeHotspot:hotspotFloor];
    } else {
        toggleFloorIsOn = true;
        PLTexture *hotspotFloorTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"floor" ofType:@"png"]]];
        hotspotFloor = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotFloorTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
        [panorama addHotspot:hotspotFloor];
    }
}

//Hotspot event
-(void)view:(UIView<PLIView> *)pView didClickHotspot:(PLHotspot *)hotspot screenPoint:(CGPoint)point scene3DPoint:(PLPosition)position
{

}

@end
