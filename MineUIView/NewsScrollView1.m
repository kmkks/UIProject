//
//  NewsScrollView1.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/12.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "NewsScrollView1.h"
#import "NewsScrollData.h"

@interface NewsScrollView1()<UIScrollViewDelegate>{
    UIScrollView * _scrollview;
    UIView * _bgView;
    UITapGestureRecognizer * _imageView1Tap;
    UITapGestureRecognizer * _imageView2Tap;
    UITapGestureRecognizer * _imageView3Tap;
    NSMutableString * _newsData;
}

@end

@implementation NewsScrollView1

-(void)initView:(int)a{
    if (_scrollview == nil) {
        _scrollview = [[UIScrollView alloc] init];
    }
    _scrollview.contentSize = CGSizeMake(Screen_Width, a);
    _scrollview.frame = CGRectMake(0, 0, Screen_Width, a);
    _scrollview.contentOffset = CGPointZero;
    
    _scrollview.bounces = YES;
    
    _scrollview.pagingEnabled = YES;
    _scrollview.showsHorizontalScrollIndicator = NO;
    _scrollview.showsVerticalScrollIndicator = NO;
    _scrollview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _scrollview.delegate = self;
    
    [_scrollview addSubview:_bgView];
    
    [self addSubview:_scrollview];
    
}

-(void)imageTap:(id)sender{
    if (sender && [sender isKindOfClass:[UITapGestureRecognizer class]]) {
        if (_delegate && [_delegate respondsToSelector:@selector(imageViewClicked:)]) {
            
            UITapGestureRecognizer * tap = (UITapGestureRecognizer *)sender;
            
            UIImageView * imageView = (UIImageView*)tap.view;
            
            [_delegate imageViewClicked:imageView.image];
            
        }
    }
}

-(void)initTextView:(CGRect)frame andText:(NSString *)text{
    UITextView * textView = [[UITextView alloc] initWithFrame:frame];
    textView.text = text;
    textView.backgroundColor = [UIColor clearColor];
    textView.font = [UIFont systemFontOfSize:18];
    [_bgView addSubview:textView];
}

-(void)initImageView:(CGRect)frame andImageName:(NSString *)imageName{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.userInteractionEnabled = YES;
//    imageView.image = [UIImage imageNamed:imageName];
    imageView.backgroundColor = [UIColor greenColor];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    
    [imageView addGestureRecognizer:tap];
    [_bgView addSubview:imageView];
}


-(void)updateMineScrollView{
    
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
    }
    _bgView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height*3);
    [self initView:[self initData:NO]];
    [self initData:YES];
}

-(int)initData:(BOOL)state{
    int a=0;
    int b=0;
    int c=0;
    NSMutableArray * textArray = [[NSMutableArray alloc]initWithObjects:_data.newsMatter1,_data.newsMatter2,_data.newsMatter3, nil];
    NSMutableArray * imageArray = [[NSMutableArray alloc] initWithObjects:_data.image1Name,_data.image2Name,_data.image3Name, nil];
    for (int index = 0;index < textArray.count ; index++) {
        if ([textArray objectAtIndex:index] == nil) {
            [textArray removeObjectAtIndex:index];
            index--;
            continue;
        }
        else{
            
            _newsData = [textArray objectAtIndex:index];
            CGRect textFrame;
            
            if (index == 0 ) {
                textFrame = CGRectMake(0, 0, Screen_Width,[self heightForTextView:_newsData] );
            }
            
            else{
                a+=100;
                textFrame = CGRectMake(0, a, Screen_Width,[self heightForTextView:_newsData] );
            }
            
            if (state) {
                [self initTextView:textFrame andText:_newsData];
            }
            
            
            a+=[self heightForTextView:_newsData];
        }
    }
    for (int index = 0;index < imageArray.count ; index++) {
        
        if ([imageArray objectAtIndex:index] == nil) {
            [imageArray removeObjectAtIndex:index];
            index--;
            continue;
        }
        
        else{
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
    }
    return a+b;
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
