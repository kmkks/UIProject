//
//  SortNewsScrollView.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/15.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "SortNewsScrollView.h"

@interface SortNewsScrollView ()<UIScrollViewDelegate>{
    NSArray * _lableTitleArray;
    UIScrollView * _scrollView;
    UIButton * _scrollViewBtn;
    UIView * _mineView;
    UIView * _scrollBackgroundView;
    UIButton * _btn;
}

@end

@implementation SortNewsScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)initWithLableTitltArray:(NSArray *)labelTitleArray{
    _lableTitleArray = labelTitleArray;
    [self initScrollView];
}

-(UILabel *)creatLableWithTitle:(NSString *)title andFrame:(CGRect)frame{
    UILabel * lable = [[UILabel alloc] initWithFrame:frame];
    lable.text = title;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = [UIColor blackColor];
    lable.backgroundColor = [UIColor lightGrayColor];
    
    lable.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * lableTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClicked:)];
    
    [lable addGestureRecognizer:lableTap];
    
    return lable;
}

-(void)labelClicked:(id)sender{
    if (sender && [sender isKindOfClass:[UITapGestureRecognizer class]]) {
        if (_sortNewsScrollViewDelegate && [_sortNewsScrollViewDelegate respondsToSelector:@selector(sortNewsScrollViewLableClicked:)]) {
            
            UITapGestureRecognizer * tap = (UITapGestureRecognizer *) sender;
            
            UILabel * lable = (UILabel *) tap.view;
            
            [_sortNewsScrollViewDelegate sortNewsScrollViewLableClicked:lable];
        }
    }
}

-(void)initScrollView{
    if (_mineView == nil) {
        _mineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 25)];
        _mineView.backgroundColor = [UIColor lightGrayColor];
    }
    
    if (_scrollView == nil) {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width-25, 25)];
        _scrollView.contentSize = CGSizeMake((Screen_Width-25)/5.5*_lableTitleArray.count-0.5, 25);
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    
    for (int index = 0; index < _lableTitleArray.count; index++) {
        [_scrollView addSubview:[self creatLableWithTitle:[_lableTitleArray objectAtIndex:index] andFrame:CGRectMake((Screen_Width-25)/5.5*index-0.5, 0, (Screen_Width-25)/5.5, 25)]];
    }
    
    
    if (_btn == nil) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_Width-25, 0, 25, 25)];
        [_btn addTarget:self action:@selector(btnclicked:) forControlEvents:UIControlEventTouchUpInside];
        _btn.backgroundColor = [UIColor whiteColor];
    }
 
    
    
    [_mineView addSubview:_scrollView];
    [_mineView addSubview:_btn];
    
    [self addSubview:_mineView];
}

-(void)btnclicked:(id)sender{
    if (sender && [sender isKindOfClass:[UIButton class]]) {
        
        if (_sortNewsScrollViewDelegate && [_sortNewsScrollViewDelegate respondsToSelector:@selector(sortNewsScrollViewBtnClicked:)]) {
            
            UIButton * button = (UIButton *)sender;
            
            [_sortNewsScrollViewDelegate sortNewsScrollViewBtnClicked:button];
        }
    }
}

@end
