//
//  SortNewsScrollView.h
//  UIProject
//
//  Created by 中软mini012 on 15/10/15.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SortNewsScrollViewDelegate <NSObject>

@required
-(void)sortNewsScrollViewLableClicked:(UILabel *)labletext;

-(void)sortNewsScrollViewBtnClicked:(UIButton *)button;

@end

@interface SortNewsScrollView : UIScrollView

@property(nonatomic,weak)id<SortNewsScrollViewDelegate> sortNewsScrollViewDelegate;

-(void)initWithLableTitltArray:(NSArray *)labelTitleArray;

@end
