//
//  ColorClasses.h
//  UITestDAY03_1
//
//  Created by 中软mini012 on 15/9/12.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#ifndef UITestDAY03_1_ColorClasses_h
#define UITestDAY03_1_ColorClasses_h

#define UIColorFromRGB(r) [UIColor colorWithRed:(r>>16&0xff)/255. green:(r>>8&0xff)/255. blue:(r&0xff)/255. alpha:1.]

#define UIColorWithRGB(r,g,b) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:1.]

#define UIColorRGB(r) [UIColor colorWithRed:(r>>16&0xff)/255. green:(r>>8&0xff)/255. blue:(r&0xff)/255. alpha:1.]

#define COLOR_NAVIGATION_BAR_BACKGROUND             0x67afee


#define Screen_Width  [UIScreen mainScreen].bounds.size.width
#define Screen_Height  [UIScreen mainScreen].bounds.size.height

#endif

