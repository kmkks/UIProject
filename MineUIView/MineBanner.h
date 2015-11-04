//
//  MineBanner.h
//  UIProject
//
//  Created by 中软mini012 on 15/10/13.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MineBannerDelegate <NSObject>

@required

-(void)bannerImageClicked:(UIImage *)image;

@end

@interface MineBanner : UIView

@property(nonatomic,weak)id<MineBannerDelegate> _mineBannerdelegate;

@end
