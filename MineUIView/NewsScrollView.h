//
//  NewsScrollView.h
//  UIProject
//
//  Created by 中软mini012 on 15/10/13.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsScrollData;

@protocol NewsScrollDataDelegate <NSObject>

@required
-(void)imageViewClicked:(UIImage*)image;

@end

@interface NewsScrollView : UIView

@property(nonatomic,strong)NewsScrollData * data;

@property(nonatomic,weak)id<NewsScrollDataDelegate> newsDelegate;

-(void)newsScrollDataUpData;

@end
