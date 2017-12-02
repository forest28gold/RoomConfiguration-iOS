//
//  RCMainViewController.m
//  Room Configuration
//
//  Created by AppsCreationTech on 11/18/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "RCMainViewController.h"
#import "RCGallerySettingsViewController.h"
#import "RCSlideShowViewController.h"
#define kIdMin 1
#define kIdMax 1000

#import "DesignModel.h"
#import "CollectionCategoryModel.h"
#import "CollectionViewHeaderView.h"
#import "LJCollectionViewFlowLayout.h"
#import "NSObject+Property.h"

@interface RCMainViewController ()
{
    NSObject<PLIPanorama> *panorama;
    
    PLHotspot *hotspotBedsheet;
    PLHotspot *hotspotComforterInterior;
    PLHotspot *hotspotComforterExterior;
    PLHotspot *hotspotPillow;
    PLHotspot *hotspotSham;
    PLHotspot *hotspotEuroSham;
    PLHotspot *hotspotFloor;
    PLHotspot *hotspotWall;
    PLHotspot *hotspotCurtains;

    NSInteger _selectIndex;
    BOOL _isScrollDown;
    
    NSArray *arrayDesignStyle;
    NSArray *arrayCatalog;
    NSString *strCatalog;
}

@property (nonatomic, strong) NSMutableArray *designDatas;
@property (nonatomic, strong) NSMutableArray *designSelectedDatas;

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *collectionDatas;

@end

@implementation RCMainViewController

@synthesize m_viewMenu, m_viewTitle;
@synthesize m_btnSave, m_btnDesign, m_btnGallery, m_btnSettings;

@synthesize m_viewDesign, m_viewGallery, m_viewSettings;
@synthesize m_viewSettingsReset, m_viewSettingsUpdate, m_viewSettingsUpload, m_viewSettingsTutorial, m_viewSettingsDownload, m_viewSettingsUserSettings;
@synthesize m_viewNameList, m_tableViewDesign, m_btnDesignName, m_imgDown, m_collectionViewDesign, m_viewDesignName;
@synthesize m_btnAdd, m_tableViewGallery, m_collectionViewGallery;
@synthesize m_txtName, m_btnCancel, m_btnSubmit, m_viewOverlay, m_viewNewFolder;
@synthesize m_btnDesigns, m_btnCatalogName, m_btnSolidColors;
@synthesize m_imgCatalogDown, m_viewCatalogList, m_viewCatalogName, m_tableViewCatalog;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrayCatalog = [NSArray arrayWithObjects:CATALOG_INDIAN, CATALOG_INTERNATIONAL, nil];
    arrayDesignStyle = [NSArray arrayWithObjects:STYLE_BEDSHEET, STYLE_COMFOR_INTER, STYLE_COMFOR_EXTER, STYLE_PILLOW, STYLE_SHAM, STYLE_EUROSHAM, STYLE_WALL, STYLE_FLOOR, STYLE_CURTAINS, nil];
    _designDatas = [[NSMutableArray alloc] init];
    
    if ([GlobalData sharedGlobalData].g_toggleRoomIsOn) {
        [self initLoadDesignTextureData];
    } else {
        [self initLoadDesignTextureData];
    }
    
    strCatalog = arrayCatalog[0];
    
    [self initSetMenuView];
    [self initSetGalleryView];
    [self onSelectDesignData:0 catalog:strCatalog];
    [self initSetPanoramaView];
    
    [[GlobalData sharedGlobalData].g_autoFormat resizeView:self.view];
    self.m_btnSave.layer.cornerRadius = 4.0f;
    self.m_viewSettingsUpdate.layer.cornerRadius = 2.0f;
    self.m_viewSettingsUpload.layer.cornerRadius = 2.0f;
    self.m_viewSettingsTutorial.layer.cornerRadius = 2.0f;
    self.m_viewSettingsReset.layer.cornerRadius = 2.0f;
    self.m_viewSettingsUserSettings.layer.cornerRadius = 2.0f;
    self.m_viewSettingsDownload.layer.cornerRadius = 2.0f;
    self.m_viewNewFolder.layer.cornerRadius = 6.0f;
    self.m_btnSubmit.layer.cornerRadius = 4.0f;
    self.m_viewCatalogName.layer.borderWidth = 1.0f;
    self.m_viewCatalogName.layer.borderColor = [UIColor colorWithHexString:@"636262"].CGColor;
    self.m_viewCatalogList.layer.borderWidth = 1.0f;
    self.m_viewCatalogList.layer.borderColor = [UIColor colorWithHexString:@"636262"].CGColor;
    self.m_viewDesignName.layer.borderWidth = 1.0f;
    self.m_viewDesignName.layer.borderColor = [UIColor colorWithHexString:@"636262"].CGColor;
    self.m_viewNameList.layer.borderWidth = 1.0f;
    self.m_viewNameList.layer.borderColor = [UIColor colorWithHexString:@"636262"].CGColor;
    
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

//--------- init Load Texture Data ---------------------

- (void)initLoadDesignTextureData {
    
    [self onLoadBedsheetDesignTextureData];
    [self onLoadComforterInteriorDesignTextureData];
    [self onLoadComforterExteriorDesignTextureData];
    [self onLoadPillowDesignTextureData];
    [self onLoadShamDesignTextureData];
    [self onLoadEuroShamDesignTextureData];
    [self onLoadFloorDesignTextureData];
    [self onLoadWallDesignTextureData];
    [self onLoadCurtainsDesignTextureData];
}

- (void)onLoadBedsheetDesignTextureData {
    
    NSArray *nameArray = [NSArray arrayWithObjects:@"1A", @"1B", @"2A", @"2B", @"3A", @"3B", @"3C", @"4A", @"4B", @"5A", @"5B", @"6A", @"7A", @"8A", @"8B", @"10A", @"11A", @"12A", @"12B", @"13A", @"13B", @"14A", @"14B", @"14C", @"15A", @"15B", @"16A", @"16B", @"17A", @"18A", @"19A", @"20A", @"21A", @"23A", nil];
    
    for (int i = 0; i < nameArray.count; i++) {
        
        DesignModel *designModel = [[DesignModel alloc] init];
        designModel.style = STYLE_BEDSHEET;
        designModel.name = nameArray[i];
        designModel.image = [NSString stringWithFormat:@"%@.jpg", [nameArray[i] lowercaseString]];
        designModel.texture = [NSString stringWithFormat:@"bedsheet_%@_scene01", [nameArray[i] lowercaseString]];
        designModel.selectIsOn = false;
        [_designDatas addObject:designModel];
    }
}

- (void)onLoadComforterInteriorDesignTextureData {
    
    NSArray *nameArray = [NSArray arrayWithObjects:@"1A", @"1B", @"2A", @"2B", @"3A", @"3B", @"3C", @"4A", @"4B", @"5A", @"5B", @"6A", @"7A", @"8A", @"8B", @"10A", @"11A", @"12A", @"12B", @"13A", @"13B", @"14A", @"14B", @"14C", @"15A", @"15B", @"16A", @"16B", @"17A", @"18A", @"19A", @"20A", @"21A", @"23A", nil];
    
    for (int i = 0; i < nameArray.count; i++) {
        
        DesignModel *designModel = [[DesignModel alloc] init];
        designModel.style = STYLE_COMFOR_INTER;
        designModel.name = nameArray[i];
        designModel.image = [NSString stringWithFormat:@"%@.jpg", [nameArray[i] lowercaseString]];
        designModel.texture = [NSString stringWithFormat:@"comforterinside_%@_scene01", [nameArray[i] lowercaseString]];
        designModel.selectIsOn = false;
        [_designDatas addObject:designModel];
    }
}

- (void)onLoadComforterExteriorDesignTextureData {
    
    NSArray *nameArray = [NSArray arrayWithObjects:@"1A", @"1B", @"2A", @"2B", @"3A", @"3B", @"3C", @"4A", @"4B", @"5A", @"5B", @"6A", @"7A", @"8A", @"8B", @"10A", @"11A", @"12A", @"12B", @"13A", @"13B", @"14A", @"14B", @"14C", @"15A", @"15B", @"16A", @"16B", @"17A", @"18A", @"19A", @"20A", @"21A", @"23A", nil];
    
    for (int i = 0; i < nameArray.count; i++) {
        
        DesignModel *designModel = [[DesignModel alloc] init];
        designModel.style = STYLE_COMFOR_EXTER;
        designModel.name = nameArray[i];
        designModel.image = [NSString stringWithFormat:@"%@.jpg", [nameArray[i] lowercaseString]];
        designModel.texture = [NSString stringWithFormat:@"comforteroutside_%@_scene01", [nameArray[i] lowercaseString]];
        designModel.selectIsOn = false;
        [_designDatas addObject:designModel];
    }
}

- (void)onLoadPillowDesignTextureData {
    
    NSArray *nameArray = [NSArray arrayWithObjects:@"1A", @"1B", @"2A", @"2B", @"3A", @"3B", @"3C", @"4A", @"4B", @"5A", @"5B", @"6A", @"7A", @"8A", @"8B", @"10A", @"11A", @"12A", @"12B", @"13A", @"13B", @"14A", @"14B", @"14C", @"15A", @"15B", @"16A", @"16B", @"17A", @"18A", @"19A", @"20A", @"21A", @"23A", nil];
    
    for (int i = 0; i < nameArray.count; i++) {
        
        DesignModel *designModel = [[DesignModel alloc] init];
        designModel.style = STYLE_PILLOW;
        designModel.name = nameArray[i];
        designModel.image = [NSString stringWithFormat:@"%@.jpg", [nameArray[i] lowercaseString]];
        designModel.texture = [NSString stringWithFormat:@"pillows_%@_scene01", [nameArray[i] lowercaseString]];
        designModel.selectIsOn = false;
        [_designDatas addObject:designModel];
    }
}

- (void)onLoadShamDesignTextureData {
    
    NSArray *nameArray = [NSArray arrayWithObjects:@"1A", @"1B", @"2A", @"2B", @"3A", @"3B", @"3C", @"4A", @"4B", @"5A", @"5B", @"6A", @"7A", @"8A", @"8B", @"10A", @"11A", @"12A", @"12B", @"13A", @"13B", @"14A", @"14B", @"14C", @"15A", @"15B", @"16A", @"16B", @"17A", @"18A", @"19A", @"20A", @"21A", @"23A", nil];
    
    for (int i = 0; i < nameArray.count; i++) {
        
        DesignModel *designModel = [[DesignModel alloc] init];
        designModel.style = STYLE_SHAM;
        designModel.name = nameArray[i];
        designModel.image = [NSString stringWithFormat:@"%@.jpg", [nameArray[i] lowercaseString]];
        designModel.texture = [NSString stringWithFormat:@"sham_%@_scene01", [nameArray[i] lowercaseString]];
        designModel.selectIsOn = false;
        [_designDatas addObject:designModel];
    }
}

- (void)onLoadEuroShamDesignTextureData {
    
    NSArray *nameArray = [NSArray arrayWithObjects:@"1A", @"1B", @"2A", @"2B", @"3A", @"3B", @"3C", @"4A", @"4B", @"5A", @"5B", @"6A", @"7A", @"8A", @"8B", @"10A", @"11A", @"12A", @"12B", @"13A", @"13B", @"14A", @"14B", @"14C", @"15A", @"15B", @"16A", @"16B", @"17A", @"18A", @"19A", @"20A", @"21A", @"23A", nil];
    
    for (int i = 0; i < nameArray.count; i++) {
        
        DesignModel *designModel = [[DesignModel alloc] init];
        designModel.style = STYLE_EUROSHAM;
        designModel.name = nameArray[i];
        designModel.image = [NSString stringWithFormat:@"%@.jpg", [nameArray[i] lowercaseString]];
        designModel.texture = [NSString stringWithFormat:@"eurosham_%@_scene01", [nameArray[i] lowercaseString]];
        designModel.selectIsOn = false;
        [_designDatas addObject:designModel];
    }
}

- (void)onLoadFloorDesignTextureData {
    
    NSArray *nameArray = [NSArray arrayWithObjects:@"Floor001", @"Floor002", @"Floor003", @"Floor004", @"Floor005", @"Floor006", @"Floor007", @"Floor008", nil];
    
    for (int i = 0; i < nameArray.count; i++) {
        
        DesignModel *designModel = [[DesignModel alloc] init];
        designModel.style = STYLE_FLOOR;
        designModel.name = nameArray[i];
        designModel.image = [NSString stringWithFormat:@"%@.jpg", [nameArray[i] lowercaseString]];
        designModel.texture = [NSString stringWithFormat:@"%@_scene01", [nameArray[i] lowercaseString]];
        designModel.selectIsOn = false;
        [_designDatas addObject:designModel];
    }
}

- (void)onLoadWallDesignTextureData {
    
    NSArray *nameArray = [NSArray arrayWithObjects:@"Wall", nil];
    
    for (int i = 0; i < nameArray.count; i++) {
        
        DesignModel *designModel = [[DesignModel alloc] init];
        designModel.style = STYLE_WALL;
        designModel.name = nameArray[i];
        designModel.image = [NSString stringWithFormat:@"%@", [nameArray[i] lowercaseString]];
        designModel.texture = [NSString stringWithFormat:@"%@", [nameArray[i] lowercaseString]];
        designModel.selectIsOn = false;
        [_designDatas addObject:designModel];
    }
}

- (void)onLoadCurtainsDesignTextureData {
    
    NSArray *nameArray = [NSArray arrayWithObjects:@"Curtains", nil];
    
    for (int i = 0; i < nameArray.count; i++) {
        
        DesignModel *designModel = [[DesignModel alloc] init];
        designModel.style = STYLE_CURTAINS;
        designModel.name = nameArray[i];
        designModel.image = [NSString stringWithFormat:@"%@", [nameArray[i] lowercaseString]];
        designModel.texture = [NSString stringWithFormat:@"%@", [nameArray[i] lowercaseString]];
        designModel.selectIsOn = false;
        [_designDatas addObject:designModel];
    }
}

//--------- init Set Views ---------------------

-(void)initSetMenuView {
    
    self.m_viewMenu.hidden = YES;
    self.m_viewMenu.frame = CGRectMake((self.view.frame.size.width + self.m_viewMenu.frame.size.width), self.m_viewMenu.frame.origin.y, self.m_viewMenu.frame.size.width, self.m_viewMenu.frame.size.height);
    
    m_btnDesign.backgroundColor = [UIColor colorWithHexString:@"d4d5d0"];
    m_btnGallery.backgroundColor = [UIColor colorWithHexString:@"433f3c"];
    [m_btnSettings setImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
    
    m_viewDesign.hidden = NO;
    m_viewGallery.hidden = YES;
    m_viewSettings.hidden = YES;
    m_viewSettingsTutorial.hidden = YES;
    m_viewNameList.hidden = YES;
    m_viewCatalogList.hidden = YES;
    
    [m_btnCatalogName setTitle:arrayCatalog[0] forState:UIControlStateNormal];
    [m_btnDesignName setTitle:arrayDesignStyle[0] forState:UIControlStateNormal];
    
    m_viewDesign.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_design = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapDesign)];
    [m_viewDesign addGestureRecognizer:tap_design];
    
    [self onSetDesignsTextures];
    
    m_viewOverlay.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_overlay = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapOverlay)];
    [m_viewOverlay addGestureRecognizer:tap_overlay];
    
    m_viewOverlay.hidden = YES;
    m_viewNewFolder.hidden = YES;
}

- (void)initSetGalleryView {
    
    _selectIndex = 0;
    _isScrollDown = YES;
    
    LJCollectionViewFlowLayout *flowlayout = [[LJCollectionViewFlowLayout alloc] init];
    [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowlayout.minimumInteritemSpacing = 5 * [GlobalData sharedGlobalData].g_autoFormat.SCALE_X;
    flowlayout.minimumLineSpacing = 10 * [GlobalData sharedGlobalData].g_autoFormat.SCALE_Y;
    flowlayout.sectionInset = UIEdgeInsetsMake(18.0 * [GlobalData sharedGlobalData].g_autoFormat.SCALE_X,
                                               18.0 * [GlobalData sharedGlobalData].g_autoFormat.SCALE_X,
                                               10.0 * [GlobalData sharedGlobalData].g_autoFormat.SCALE_Y,
                                               10.0 * [GlobalData sharedGlobalData].g_autoFormat.SCALE_Y); //{ .left = 50, .right = 50, .top = 10, .bottom = 10 };
    m_collectionViewGallery.collectionViewLayout = flowlayout;
    
    [m_collectionViewGallery registerClass:[CollectionViewHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionViewHeaderView"];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"gallerydata" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *categories = dict[@"data"][@"categories"];
    for (NSDictionary *dict in categories)
    {
        CollectionCategoryModel *model = [CollectionCategoryModel objectWithDictionary:dict];
        [self.dataSource addObject:model];
        
        NSMutableArray *datas = [NSMutableArray array];
        for (SubCategoryModel *sModel in model.subcategories)
        {
            [datas addObject:sModel];
        }
        [self.collectionDatas addObject:datas];
    }
    
    [self.m_tableViewGallery reloadData];
    [self.m_collectionViewGallery reloadData];
    [self.m_tableViewGallery selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    
}

#pragma mark - Getters

- (NSMutableArray *)dataSource
{
    if (!_dataSource)
    {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (NSMutableArray *)collectionDatas
{
    if (!_collectionDatas)
    {
        _collectionDatas = [NSMutableArray array];
    }
    return _collectionDatas;
}

- (void)onSelectDesignData:(NSInteger)index catalog:(NSString*)catalog {
    
    _designSelectedDatas = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < _designDatas.count; i++) {
        DesignModel *record = _designDatas[i];
        
        if ([record.style isEqualToString:arrayDesignStyle[index]]) {
            [_designSelectedDatas addObject:record];
        }
    }
    
    [m_collectionViewDesign reloadData];
    [m_collectionViewDesign setContentOffset:CGPointZero animated:NO];
}

-(void)initSetPanoramaView {
    
    PLTexture *hotspotBedsheetTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"empty" ofType:@"png"]]];
    hotspotBedsheet = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotBedsheetTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
    
    PLTexture *hotspotComforterInteriorTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"empty" ofType:@"png"]]];
    hotspotComforterInterior = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotComforterInteriorTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
    
    PLTexture *hotspotComforterExteriorTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"empty" ofType:@"png"]]];
    hotspotComforterExterior = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotComforterExteriorTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
    
    PLTexture *hotspotPillowTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"empty" ofType:@"png"]]];
    hotspotPillow = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotPillowTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
    
    PLTexture *hotspotShamTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"empty" ofType:@"png"]]];
    hotspotSham = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotShamTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
    
    PLTexture *hotspotEuroShamTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"empty" ofType:@"png"]]];
    hotspotEuroSham = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotEuroShamTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
    
    PLTexture *hotspotFloorTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"empty" ofType:@"png"]]];
    hotspotFloor = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotFloorTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
    
    PLTexture *hotspotCurtainsTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"empty" ofType:@"png"]]];
    hotspotCurtains = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotCurtainsTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
    
    PLTexture *hotspotWallTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"empty" ofType:@"png"]]];
    hotspotWall = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotWallTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
    
    self.plView.delegate = self;
    panorama = [PLSphericalPanorama panorama];
    
    if ([GlobalData sharedGlobalData].g_toggleRoomIsOn) {
        [(PLSphericalPanorama *)panorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"room_pano01" ofType:@"jpg"]]]];
    } else {
        [(PLSphericalPanorama *)panorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"room_pano02" ofType:@"jpg"]]]];
    }
    
    [panorama addHotspot:hotspotBedsheet];
    [panorama addHotspot:hotspotComforterInterior];
    [panorama addHotspot:hotspotComforterExterior];
    [panorama addHotspot:hotspotPillow];
    [panorama addHotspot:hotspotSham];
    [panorama addHotspot:hotspotEuroSham];
    [panorama addHotspot:hotspotFloor];
    [panorama addHotspot:hotspotCurtains];
    [panorama addHotspot:hotspotWall];
    
    [self.plView setPanorama:panorama];
    
}

- (void)showMenuView {
    
    self.m_viewMenu.hidden = NO;

    [UIView animateWithDuration:.4 animations:^{
        self.m_viewMenu.frame = CGRectMake((self.view.frame.size.width - self.m_viewMenu.frame.size.width), self.m_viewMenu.frame.origin.y, self.m_viewMenu.frame.size.width, self.m_viewMenu.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            
        }
    }];
    
}

- (void)closeMenuView {
    
    [UIView animateWithDuration:.4 animations:^{
        self.m_viewMenu.frame = CGRectMake((self.view.frame.size.width + self.m_viewMenu.frame.size.width), self.m_viewMenu.frame.origin.y, self.m_viewMenu.frame.size.width, self.m_viewMenu.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            self.m_viewMenu.hidden = YES;
        }
    }];
}

- (void)showDropMenuView:(UIView*)mView arrow:(UIImageView*)mArrowImage {
    
    if (!mView.hidden) {
        [self removeDropMenuView:mView arrow:mArrowImage];
    } else {
        mView.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
        mView.alpha = 0;
        mView.hidden = NO;
        [UIView animateWithDuration:.15 animations:^{
            mView.alpha = 1;
            mView.transform = CGAffineTransformMakeScale(1, 1);
            mArrowImage.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    }
}

- (void)removeDropMenuView:(UIView*)mView arrow:(UIImageView*)mArrowImage {
    
    [UIView animateWithDuration:.15 animations:^{
        mView.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
        mView.alpha = 0.0;
        mArrowImage.transform = CGAffineTransformMakeRotation(0);
    } completion:^(BOOL finished) {
        if (finished) {
            mView.hidden = YES;
        }
    }];
}

- (void)showAnimateView:(UIView*)mView overlay:(UIView*)overlayView
{
    overlayView.hidden = NO;
    mView.hidden = NO;
    mView.transform = CGAffineTransformMakeScale(1.3, 1.3);
    mView.alpha = 0;
    [UIView animateWithDuration:.15 animations:^{
        mView.alpha = 1;
        mView.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)removeAnimateView:(UIView*)mView overlay:(UIView*)overlayView
{
    [UIView animateWithDuration:.15 animations:^{
        mView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        mView.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            overlayView.hidden = YES;
            mView.hidden = YES;
        }
    }];
}

- (IBAction)onBack:(id)sender {
    
    [panorama removeAllHotspots];
    [panorama removeAllTextures];
    [panorama removeAllPreviewTextures];
    [panorama removeAllCameras];
    [panorama removeAllElements];
    
    [self.navigationController popViewControllerAnimated:YES];
}

// Capture

-(IBAction)onSelectCaptureScreen:(id)sender
{
    m_viewTitle.hidden = YES;
    CGSize size = CGSizeMake(self.view.frame.size.width * 5, self.view.frame.size.height * 5);
    UIImage *viewImage = [self screenshot:size];
    
    SVPROGRESSHUD_SHOW;
    m_viewTitle.hidden = NO;
    
    if(viewImage){
        UIImageWriteToSavedPhotosAlbum(viewImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
}

- (UIImage *)screenshot:(CGSize)size {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    CGRect rec = CGRectMake(0, 0, size.width, size.height);
    [self.view drawViewHierarchyInRect:rec afterScreenUpdates:YES];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {  //can also handle error message as well
    
    SVPROGRESSHUD_DISMISS;
    
    if (error == nil) {
        [[GlobalData sharedGlobalData] onErrorAlert:@"Saved successfully."];
    } else {
        [[GlobalData sharedGlobalData] onErrorAlert:@"Screen capture is failed. Please try again."];
    }
}

// Menu

-(IBAction)onSelectMenu:(id)sender
{
    [self showMenuView];
}

// Save Menu

-(IBAction)onCloseMenu:(id)sender
{
    [self closeMenuView];
}

// Design Menu

-(IBAction)onSetDesign:(id)sender
{
    m_btnDesign.backgroundColor = [UIColor colorWithHexString:@"d4d5d0"];
    m_btnGallery.backgroundColor = [UIColor colorWithHexString:@"433f3c"];
    [m_btnSettings setImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
    
    m_viewDesign.hidden = NO;
    m_viewGallery.hidden = YES;
    m_viewSettings.hidden = YES;
}

- (void)onTapDesign {
    
    [self removeDropMenuView:m_viewCatalogList arrow:m_imgCatalogDown];
    [self removeDropMenuView:m_viewNameList arrow:m_imgDown];
}

-(IBAction)onSelectDesignName:(id)sender
{
    [self removeDropMenuView:m_viewCatalogList arrow:m_imgCatalogDown];
    [self showDropMenuView:m_viewNameList arrow:m_imgDown];
}

-(IBAction)onSelectCatalogName:(id)sender
{
    [self removeDropMenuView:m_viewNameList arrow:m_imgDown];
    [self showDropMenuView:m_viewCatalogList arrow:m_imgCatalogDown];
}

- (void)onSetDesignsTextures {
    
    [m_btnDesigns setTitleColor:[UIColor colorWithHexString:@"ffbc19"] forState:UIControlStateNormal];
    [m_btnDesigns setBackgroundColor:[UIColor colorWithHexString:@"1f1e19"]];
    
    [m_btnSolidColors setTitleColor:[UIColor colorWithHexString:@"00875f"] forState:UIControlStateNormal];
    [m_btnSolidColors setBackgroundColor:[UIColor colorWithHexString:@"ffffff"]];
}

- (void)onSetSolidColorsTextures {
    
    [m_btnDesigns setTitleColor:[UIColor colorWithHexString:@"00875f"] forState:UIControlStateNormal];
    [m_btnDesigns setBackgroundColor:[UIColor colorWithHexString:@"ffffff"]];
    
    [m_btnSolidColors setTitleColor:[UIColor colorWithHexString:@"ffbc19"] forState:UIControlStateNormal];
    [m_btnSolidColors setBackgroundColor:[UIColor colorWithHexString:@"1f1e19"]];
}

-(IBAction)onSelectDesigns:(id)sender
{
    [self onTapDesign];
    [self onSetDesignsTextures];
    
    
}

-(IBAction)onSelectSolidColors:(id)sender
{
    [self onTapDesign];
    [self onSetSolidColorsTextures];
    
    
}

#pragma mark - UITableView DataSource Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag == 1) { // Design
        return 30 * [GlobalData sharedGlobalData].g_autoFormat.SCALE_Y;
    } else if (tableView.tag == 2)  { // Gallery
        return 65 * [GlobalData sharedGlobalData].g_autoFormat.SCALE_Y;
    } else { // Catalog
        return 30 * [GlobalData sharedGlobalData].g_autoFormat.SCALE_Y;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    if (tableView.tag == 1) { // Design
        return arrayDesignStyle.count;
    } else if (tableView.tag == 2) { // Gallery
        return self.dataSource.count;
    } else { // Catalog
        return arrayCatalog.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag == 1) { // Design
        
        UITableViewCell* _cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"DesignNameCell" forIndexPath:indexPath];
        
        
        UIButton* m_btnName = (UIButton*)[_cell viewWithTag:1];
        [m_btnName setTitle:arrayDesignStyle[indexPath.row] forState:UIControlStateNormal];
        
        
        [m_btnName addTarget:self action:@selector(onSelectName:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView* _m_view = (UIView*)[_cell viewWithTag:10];
        if (_m_view.frame.size.width < self.m_tableViewDesign.frame.size.width) {
            [[GlobalData sharedGlobalData].g_autoFormat resizeView:_cell];
        }
        
        return _cell;
        
    } else if (tableView.tag == 2)  { // Gallery
        
        UITableViewCell* _cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"FolderCell" forIndexPath:indexPath];
        
        UIButton* m_btnFolder = (UIButton*)[_cell viewWithTag:1];
        UILabel* m_lblFolderName = (UILabel*)[_cell viewWithTag:2];
        
        CollectionCategoryModel *model = self.dataSource[indexPath.row];
        
        m_lblFolderName.text = model.name;
        
        
        [m_btnFolder addTarget:self action:@selector(onSelectGalleryFolder:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView* _m_view = (UIView*)[_cell viewWithTag:10];
        if (_m_view.frame.size.width < self.m_tableViewGallery.frame.size.width) {
            [[GlobalData sharedGlobalData].g_autoFormat resizeView:_cell];
        }
        
        if (_cell.selected) {
            _cell.contentView.backgroundColor = [UIColor colorWithHexString:@"255e4d"];
            [m_btnFolder setImage:[UIImage imageNamed:@"folder_yellow"] forState:UIControlStateNormal];
        } else {
            _cell.contentView.backgroundColor = [UIColor colorWithHexString:@"188a69"];
            [m_btnFolder setImage:[UIImage imageNamed:@"folder"] forState:UIControlStateNormal];
        }
        
        return _cell;
        
    } else { // Catalog
     
        UITableViewCell* _cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"CatalogNameCell" forIndexPath:indexPath];
        
        
        UIButton* m_btnName = (UIButton*)[_cell viewWithTag:1];
        [m_btnName setTitle:arrayCatalog[indexPath.row] forState:UIControlStateNormal];
        
        
        [m_btnName addTarget:self action:@selector(onSelectCatalogListName:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView* _m_view = (UIView*)[_cell viewWithTag:10];
        if (_m_view.frame.size.width < self.m_tableViewCatalog.frame.size.width) {
            [[GlobalData sharedGlobalData].g_autoFormat resizeView:_cell];
        }
        
        return _cell;
    }
}

//------------------

- (void)onSelectCatalogListName:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    CGRect buttonFrameInTableView = [btn convertRect:btn.bounds toView:self.m_tableViewCatalog];
    NSIndexPath *indexPath = [self.m_tableViewCatalog indexPathForRowAtPoint:buttonFrameInTableView.origin];
    
    [m_btnCatalogName setTitle:arrayCatalog[indexPath.row] forState:UIControlStateNormal];
    
    strCatalog = arrayCatalog[indexPath.row];
    
    [self removeDropMenuView:m_viewCatalogList arrow:m_imgCatalogDown];
    
    [self onSelectDesignData:indexPath.row catalog:strCatalog];
}

- (void)onSelectName:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    CGRect buttonFrameInTableView = [btn convertRect:btn.bounds toView:self.m_tableViewDesign];
    NSIndexPath *indexPath = [self.m_tableViewDesign indexPathForRowAtPoint:buttonFrameInTableView.origin];
    
    [m_btnDesignName setTitle:arrayDesignStyle[indexPath.row] forState:UIControlStateNormal];
    
    [self removeDropMenuView:m_viewNameList arrow:m_imgDown];
    
    [self onSelectDesignData:indexPath.row catalog:strCatalog];
}

- (void)onSelectGalleryFolder:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    CGRect buttonFrameInTableView = [btn convertRect:btn.bounds toView:self.m_tableViewGallery];
    NSIndexPath *indexPath = [self.m_tableViewGallery indexPathForRowAtPoint:buttonFrameInTableView.origin];
    
    [m_tableViewGallery cellForRowAtIndexPath:indexPath].selected = YES;
    [m_tableViewGallery reloadData];
    
    _selectIndex = indexPath.row;
    [self.m_collectionViewGallery scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:_selectIndex] atScrollPosition:UICollectionViewScrollPositionTop animated:YES];    
    [self.m_tableViewGallery selectRowAtIndexPath:[NSIndexPath indexPathForRow:_selectIndex inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
//    [self.m_tableViewGallery selectRowAtIndexPath:[NSIndexPath indexPathForRow:_selectIndex inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

#pragma mark - UICollectionView DataSource Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (collectionView.tag == 1) { // Design
        return 1;
    } else { // Gallery
        return self.dataSource.count;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (collectionView.tag == 1) { // Design
        return _designSelectedDatas.count;
    } else { // Gallery
        CollectionCategoryModel *model = self.dataSource[section];
        return model.subcategories.count;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView.tag == 1) { // Design
        CGSize size = CGSizeMake(61*[GlobalData sharedGlobalData].g_autoFormat.SCALE_X, 80*[GlobalData sharedGlobalData].g_autoFormat.SCALE_Y);
        return size;
    } else { // Gallery
        CGSize size = CGSizeMake(100*[GlobalData sharedGlobalData].g_autoFormat.SCALE_X, 100*[GlobalData sharedGlobalData].g_autoFormat.SCALE_Y);
        return size;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView.tag == 1) { // Design
        
        UICollectionViewCell *_cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DesignCell" forIndexPath:indexPath];
        
        UIImageView* _imgDesign = (UIImageView*)[_cell viewWithTag:4];
        UILabel* _lblName = (UILabel*)[_cell viewWithTag:2];
        UIButton* _btnDesign = (UIButton*)[_cell viewWithTag:3];
        [_btnDesign addTarget:self action:@selector(onSelectTexture:) forControlEvents:UIControlEventTouchUpInside];
        
        DesignModel *record = _designSelectedDatas[indexPath.row];
        
        [_imgDesign setImage:[UIImage imageNamed:record.image]];
        _lblName.text = record.name;
        
        if (record.selectIsOn) {
            _btnDesign.layer.borderWidth = 3.0f;
            _btnDesign.layer.borderColor = [UIColor colorWithHexString:@"008d66"].CGColor;
        } else {
            _btnDesign.layer.borderWidth = 0.0f;
            _btnDesign.layer.borderColor = [UIColor clearColor].CGColor;
        }
        
        return _cell;
        
    } else { // Gallery
        
        UICollectionViewCell *_cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GalleryCell" forIndexPath:indexPath];
        
        UIImageView* _imgGalleryImg = (UIImageView*)[_cell viewWithTag:5];
        UILabel* _lblName = (UILabel*)[_cell viewWithTag:2];
        UIButton* _btnGallery = (UIButton*)[_cell viewWithTag:3];
        UIView* _viewGallery = (UIView*)[_cell viewWithTag:4];
        
        _viewGallery.layer.borderWidth = 3.0;
        _viewGallery.layer.borderColor = [UIColor whiteColor].CGColor;
        _viewGallery.layer.shadowOpacity = 0.7;
        _viewGallery.layer.shadowRadius = 3.0f;
        _viewGallery.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
        
        [_btnGallery addTarget:self action:@selector(onSelectGalleryImage:) forControlEvents:UIControlEventTouchUpInside];
        
        SubCategoryModel *model = self.collectionDatas[indexPath.section][indexPath.row];
        _lblName.text = model.name;
        
//        NSURL *imageURL = [NSURL URLWithString:model.icon_url];
//        [_imgGalleryImg setShowActivityIndicatorView:YES];
//        [_imgGalleryImg setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
//        [_imgGalleryImg sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"loading"]];

        [_imgGalleryImg setImage:[UIImage imageNamed:model.image]];
        
        return _cell;
    }
}

//------------------

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == 1) { // Design
        return nil;
    } else { // Gallery
        
        NSString *reuseIdentifier;
        if ([kind isEqualToString:UICollectionElementKindSectionHeader])
        { // header
            reuseIdentifier = @"CollectionViewHeaderView";
        }
        CollectionViewHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        if ([kind isEqualToString:UICollectionElementKindSectionHeader])
        {
            CollectionCategoryModel *model = self.dataSource[indexPath.section];
            view.title.text = model.name;
        }
        return view;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (collectionView.tag == 1) { // Design
        return CGSizeMake(m_collectionViewDesign.frame.size.width, 0);
    } else { // Gallery
        return CGSizeMake(m_collectionViewGallery.frame.size.width, 30);
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    
    if (collectionView.tag == 2) { // Gallery
        if (!_isScrollDown && collectionView.dragging)
        {
            [self selectRowAtIndexPath:indexPath.section];
        }
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(nonnull UICollectionReusableView *)view forElementOfKind:(nonnull NSString *)elementKind atIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (collectionView.tag == 2) { // Gallery
        if (_isScrollDown && collectionView.dragging)
        {
            [self selectRowAtIndexPath:indexPath.section + 1];
        }
    }
}

- (void)selectRowAtIndexPath:(NSInteger)index
{
    [m_tableViewGallery cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]].selected = YES;
    [m_tableViewGallery reloadData];
    
    [self.m_tableViewGallery selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
//    [self.m_tableViewGallery selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static float lastOffsetY = 0;
    
    if (self.m_collectionViewGallery == scrollView)
    {
        _isScrollDown = lastOffsetY < scrollView.contentOffset.y;
        lastOffsetY = scrollView.contentOffset.y;
    }
}

//------------------

-(void)onSelectTexture:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    CGRect buttonFrameInTableView = [btn convertRect:btn.bounds toView:self.m_collectionViewDesign];
    NSIndexPath *indexPath = [self.m_collectionViewDesign indexPathForItemAtPoint:buttonFrameInTableView.origin];
    
    for (int i = 0; i < _designSelectedDatas.count; i++) {
        
        DesignModel *record = _designSelectedDatas[i];
        
        if (i == indexPath.row) {
            record.selectIsOn = true;
        } else {
            record.selectIsOn = false;
        }
    }
    
    [self.m_collectionViewDesign reloadData];
    
    DesignModel *record = _designSelectedDatas[indexPath.row];
    [self onSetRoomDesignTexure:record.style imageTexture:record.texture selected:record.selectIsOn];
}

-(void)onSelectGalleryImage:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    CGRect buttonFrameInTableView = [btn convertRect:btn.bounds toView:self.m_collectionViewGallery];
    NSIndexPath *indexPath = [self.m_collectionViewGallery indexPathForItemAtPoint:buttonFrameInTableView.origin];
    
    
    RCSlideShowViewController *nextCtrl = [[self storyboard]instantiateViewControllerWithIdentifier:VIEW_SLIDE_SHOW];
    [self.navigationController pushViewController:nextCtrl animated:true];
    
}

- (void)onSetRoomDesignTexure:(NSString*)textureName imageTexture:(NSString *)imgTexture selected:(BOOL)selected {
    
    if ([textureName isEqualToString:STYLE_BEDSHEET]) {
        
        [panorama removeHotspot:hotspotBedsheet];
        PLTexture *hotspotBedsheetTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:imgTexture ofType:@"png"]]];
        hotspotBedsheet = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotBedsheetTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
        [panorama addHotspot:hotspotBedsheet];
        
    } else if ([textureName isEqualToString:STYLE_COMFOR_INTER]) {
        
        [panorama removeHotspot:hotspotComforterInterior];
        PLTexture *hotspotComforterInteriorTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:imgTexture ofType:@"png"]]];
        hotspotComforterInterior = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotComforterInteriorTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
        [panorama addHotspot:hotspotComforterInterior];
        
    } else if ([textureName isEqualToString:STYLE_COMFOR_EXTER]) {
        
        [panorama removeHotspot:hotspotComforterExterior];
        PLTexture *hotspotComforterExteriorTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:imgTexture ofType:@"png"]]];
        hotspotComforterExterior = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotComforterExteriorTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
        [panorama addHotspot:hotspotComforterExterior];
        
    } else if ([textureName isEqualToString:STYLE_PILLOW]) {
        
        [panorama removeHotspot:hotspotPillow];
        PLTexture *hotspotPillowTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:imgTexture ofType:@"png"]]];
        hotspotPillow = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotPillowTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
        [panorama addHotspot:hotspotPillow];
        
    } else if ([textureName isEqualToString:STYLE_SHAM]) {
        
        [panorama removeHotspot:hotspotSham];
        PLTexture *hotspotShamTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:imgTexture ofType:@"png"]]];
        hotspotSham = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotShamTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
        [panorama addHotspot:hotspotSham];

    } else if ([textureName isEqualToString:STYLE_EUROSHAM]) {
        
        [panorama removeHotspot:hotspotEuroSham];
        PLTexture *hotspotEuroShamTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:imgTexture ofType:@"png"]]];
        hotspotEuroSham = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotEuroShamTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
        [panorama addHotspot:hotspotEuroSham];
        
    } else if ([textureName isEqualToString:STYLE_CURTAINS]) {
        
        [panorama removeHotspot:hotspotCurtains];
        PLTexture *hotspotCurtainsTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:imgTexture ofType:@"png"]]];
        hotspotCurtains = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotCurtainsTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
        [panorama addHotspot:hotspotCurtains];
        
    } else if ([textureName isEqualToString:STYLE_WALL]) {
        
        [panorama removeHotspot:hotspotWall];
        PLTexture *hotspotWallTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:imgTexture ofType:@"png"]]];
        hotspotWall = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotWallTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
        [panorama addHotspot:hotspotWall];
        
    } else if ([textureName isEqualToString:STYLE_FLOOR]) {
        
        [panorama removeHotspot:hotspotFloor];
        PLTexture *hotspotFloorTexture = [PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:imgTexture ofType:@"png"]]];
        hotspotFloor = [PLHotspot hotspotWithId:(kIdMin + random() % ((kIdMax + 1) - kIdMin)) texture:hotspotFloorTexture atv:0.0f ath:0.0f width:1.0f height:1.0f];
        [panorama addHotspot:hotspotFloor];
    }
    
}

// Gallery Menu

-(IBAction)onSetGallery:(id)sender
{
    m_btnDesign.backgroundColor = [UIColor colorWithHexString:@"433f3c"];
    m_btnGallery.backgroundColor = [UIColor colorWithHexString:@"d4d5d0"];
    [m_btnSettings setImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
    
    m_viewDesign.hidden = YES;
    m_viewGallery.hidden = NO;
    m_viewSettings.hidden = YES;
}

-(IBAction)onAddNewFolder:(id)sender
{
    m_txtName.text = @"";
    [self showAnimateView:m_viewNewFolder overlay:m_viewOverlay];
}

- (void)onTapOverlay {
    [self dismissKeyboard];
    [self removeAnimateView:m_viewNewFolder overlay:m_viewOverlay];
}

-(IBAction)onCancelNewFolder:(id)sender
{
    [self dismissKeyboard];
    [self removeAnimateView:m_viewNewFolder overlay:m_viewOverlay];
}

-(IBAction)onSubmitNewFolder:(id)sender
{
    [self dismissKeyboard];
    
    NSString *strName = m_txtName.text;
    if ([strName isEqualToString:@""]) {
        [[GlobalData sharedGlobalData] onErrorAlert:@"Please enter new gallery name."];
        return;
    }
    
    
    
    [self removeAnimateView:m_viewNewFolder overlay:m_viewOverlay];
}

#pragma mark Keyboard

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self onSubmitNewFolder:textField];
    return YES;
}

// Settings Menu

-(IBAction)onSetSettings:(id)sender
{
    m_btnDesign.backgroundColor = [UIColor colorWithHexString:@"433f3c"];
    m_btnGallery.backgroundColor = [UIColor colorWithHexString:@"433f3c"];
    [m_btnSettings setImage:[UIImage imageNamed:@"settings_white"] forState:UIControlStateNormal];
    
    m_viewDesign.hidden = YES;
    m_viewGallery.hidden = YES;
    m_viewSettings.hidden = NO;
}

-(IBAction)onSetSettingsOption:(id)sender
{
    RCGallerySettingsViewController *nextCtrl = [[self storyboard]instantiateViewControllerWithIdentifier:VIEW_GALLERY_SETTINGS];
    [self.navigationController pushViewController:nextCtrl animated:true];
}

-(IBAction)onSetSettingsUpdateDatabase:(id)sender
{
    
}

-(IBAction)onSetSettingsUploadGallery:(id)sender
{
    
}

-(IBAction)onSetSettingsTutorials:(id)sender
{
    
}

-(IBAction)onSetSettingsReset:(id)sender
{
    
}

-(IBAction)onSetSettingsDownload:(id)sender
{
    
}

-(IBAction)onSetSettingsUserSettings:(id)sender
{
    
}

@end
