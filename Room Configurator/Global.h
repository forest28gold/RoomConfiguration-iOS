//
//  Global.h
//  Room Configuration
//
//  Created by AppsCreationTech on 11/17/16.
//  Copyright © 2016 Arimon Frank. All rights reserved.
//


#ifndef ROOMCONFIGURATION_Global_h
#define ROOMCONFIGURATION_Global_h

#define SCREEN_WIDTH                                                [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT                                               [UIScreen mainScreen].bounds.size.height
#define rgba(r,g,b,a)                                               [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define LOAD_DATA_COUNT                                             15

#define VIEW_GET_STARTED                                            @"RCGetStartedViewController"
#define VIEW_ROOM_SELECTION                                         @"RCRoomSelectionViewController"
#define VIEW_MAIN                                                   @"RCMainViewController"
#define VIEW_GALLERY_SETTINGS                                       @"RCGallerySettingsViewController"
#define VIEW_SLIDE_SHOW                                             @"RCSlideShowViewController"


//#define SEGUE_PHOTO                                                 @"segue_photo"
//#define UNWIND_POST_PHOTO                                           @"unWindPostPhoto"

#define CATALOG_INDIAN                                              @"Indian"
#define CATALOG_INTERNATIONAL                                       @"International"

#define STYLE_BEDSHEET                                              @"Bedsheet"
#define STYLE_COMFOR_INTER                                          @"Comforter Interior"
#define STYLE_COMFOR_EXTER                                          @"Comforter Exterior"
#define STYLE_PILLOW                                                @"Pillow"
#define STYLE_SHAM                                                  @"Sham"
#define STYLE_EUROSHAM                                              @"EuroSham"
#define STYLE_WALL                                                  @"Wall"
#define STYLE_FLOOR                                                 @"Floor"
#define STYLE_CURTAINS                                              @"Curtains"



// show SVProgressHUD

#define SVPROGRESSHUD_SHOW                                          [SVProgressHUD showWithStatus:NSLocalizedString(@"please_wait", "") maskType:SVProgressHUDMaskTypeClear]
#define SVPROGRESSHUD_DISMISS                                       [SVProgressHUD dismiss]
#define SVPROGRESSHUD_SUCCESS(status)                               [SVProgressHUD showSuccessWithStatus:status]
#define SVPROGRESSHUD_ERROR(status)                                 [SVProgressHUD showErrorWithStatus:status]
#define SVPROGRESSHUD_NETWORK_ERROR                                 [SVProgressHUD showErrorWithStatus:NETWORK_ERR_MESSAGE]




#endif
