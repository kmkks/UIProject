//
//  NewsScrollView1.h
//  UIProject
//
//  Created by 中软mini012 on 15/10/12.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsScrollData;

@protocol NewsScrollViewDelegate <NSObject>

@required
-(void)imageViewClicked:(UIImage*)image;

@optional
-(void)btnClicked:(id)sender;

@end

@interface NewsScrollView1 : UIView

@property(nonatomic,weak)id<NewsScrollViewDelegate> delegate;

@property(nonatomic,strong)NewsScrollData * data;

-(void)updateMineScrollView;

@end
