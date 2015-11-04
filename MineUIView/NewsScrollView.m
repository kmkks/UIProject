//
//  NewsScrollView.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/13.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "NewsScrollView.h"
#import "NewsScrollData.h"

@interface NewsScrollView (){
    NSString * _newsData;
    UIView * _bgView;
    UIScrollView * _scrollView;
    UITapGestureRecognizer * _tap;
}

@end

@implementation NewsScrollView

-(void)initView:(int)a{
    if (_bgView == nil) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, a)];
    }
    
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, a)];
    }
    
    self.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
    _scrollView.contentOffset = CGPointZero;
    _scrollView.bounces = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [_scrollView addSubview:_bgView];
    [self addSubview:_scrollView];
    
}

-(void)newsScrollDataUpData{
    
    [self initView:[self initData:NO]];
    _scrollView.contentSize = CGSizeMake(Screen_Width,[self initData:NO]);
    [self initData:YES];
    
}


-(int)initData:(BOOL)state{
    int a=0;
    int b=0;
    int c=0;
    NSMutableArray * textArray = [[NSMutableArray alloc]initWithObjects:_data.newsMatter1,_data.newsMatter2,_data.newsMatter3, nil];
    NSMutableArray * imageArray = [[NSMutableArray alloc] initWithObjects:_data.image1Name,_data.image2Name,_data.image3Name, nil];
    for (int index = 0;index < textArray.count ; index++) {
        _newsData = [textArray objectAtIndex:index];
        CGRect textFrame;
            
        if (index == 0 ) {
            textFrame = CGRectMake(0, 0, Screen_Width,[self heightForTextView:_newsData] );
        }
            
        else{
            if (index-1 < imageArray.count ) {
                a+=100;
            }
            
            textFrame = CGRectMake(0, a, Screen_Width,[self heightForTextView:_newsData] );
        }
            
        if (state) {
            [self initTextView:textFrame andText:_newsData];
        }
        
        a+=[self heightForTextView:_newsData];
        
    }
    for (int index = 0;index < imageArray.count ; index++) {
        
        c=0;
        
        if (index<textArray.count) {
            
            int index1 = index;
            _newsData = [textArray objectAtIndex:index1];
            c+=(int)[self heightForTextView:_newsData];
                
            while (index1) {
                _newsData = [textArray objectAtIndex:index1];
                c+=(int)[self heightForTextView:_newsData]+100;
                index1--;
            }
            b=c;
        }
            
        else{
            b+=100;
        }
        
        CGRect imageFrame = CGRectMake(0, b, 200, 100);
        
        if (state) {
            [self initImageView:imageFrame andImageName:[imageArray objectAtIndex:index]];
        }
    }
    return a+b;
}

-(void)initTextView:(CGRect)frame andText:(NSString *)text{
    UITextView * textView = [[UITextView alloc] initWithFrame:frame];
    textView.editable = NO;
    textView.text = text;
    textView.font = [UIFont systemFontOfSize:18];
    [_bgView addSubview:textView];
}

-(void)initImageView:(CGRect)frame andImageName:(NSString *)imageName{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:imageName];
    
    _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    
    [imageView addGestureRecognizer:_tap];
    [_bgView addSubview:imageView];
}

-(void)imageTap:(id)sender{
    if (sender && [sender isKindOfClass:[UITapGestureRecognizer class]]) {
        if (_newsDelegate && [_newsDelegate respondsToSelector:@selector(imageViewClicked:)]) {
            
            UITapGestureRecognizer * tap = (UITapGestureRecognizer *)sender;
            
            UIImageView * imageView = (UIImageView*)tap.view;
            
            [_newsDelegate imageViewClicked:imageView.image];
            
        }
    }
}

-(long)heightForTextView:(NSString *)str{
    long textHeight=0;
    long line=0;
    line=str.length/36.0;
    if((str.length%36)>0){
        if (line==0)
            textHeight=1;
        else
            textHeight=line+1;
    }
    else{
        textHeight=line+1;
    }
    textHeight*=(Screen_Height-108)/26+18;
    return textHeight;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
