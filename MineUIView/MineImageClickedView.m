//
//  MineImageClickedView.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/13.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "MineImageClickedView.h"

@interface MineImageClickedView (){
    UIView * _view;
    UIImageView * _imageView;
    UITapGestureRecognizer * _viewTap;
}

@end

@implementation MineImageClickedView

-(void)mineImageClickedUpData{
    [self initUI:_image];
}

-(void)initUI:(UIImage *)image{
    
    self.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
    
    if (_view == nil) {
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    }
    
    _view.backgroundColor = [UIColor colorWithRed:(40/255.0) green:(40/255.0) blue:(40/255.0) alpha:0.6];
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, Screen_Height/2-Screen_Height/4, Screen_Width, Screen_Height/2)];
    }
    
    if (_viewTap == nil) {
        _viewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapClicked:)];
    }
    
    [_view addGestureRecognizer:_viewTap];
    
    _imageView.image = image;
    
    [_view addSubview:_imageView];
    
    
    [self addSubview:_view];
}

-(void)viewTapClicked:(id)sender{
    if (sender && [sender isKindOfClass:[UITapGestureRecognizer class]]) {
        if (_mineImageClickedViewDelegate && [_mineImageClickedViewDelegate respondsToSelector:@selector(mineImageClicked)]) {
            
            
            [_mineImageClickedViewDelegate mineImageClicked];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
