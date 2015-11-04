//
//  MineImageClickedView.h
//  UIProject
//
//  Created by 中软mini012 on 15/10/13.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MineImageClickedDeleagte <NSObject>

@required

-(void)mineImageClicked;

@end

@interface MineImageClickedView : UIView

@property(nonatomic,weak)id<MineImageClickedDeleagte> mineImageClickedViewDelegate;

@property(nonatomic,copy) UIImage * image;

-(void)mineImageClickedUpData;

@end
