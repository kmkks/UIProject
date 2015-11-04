//
//  NewsViewController.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/10.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "NewsViewController.h"
#import "EngineManeger.h"
#import "EngineNews.h"
#import "NewsScrollView.h"
#import "NewsScrollData.h"
#import "MineImageClickedView.h"

@interface NewsViewController ()<UIAlertViewDelegate,UIScrollViewDelegate,NewsScrollDataDelegate,MineImageClickedDeleagte>{
    EngineNews * _news;
    NSArray * _newsArr;
    UIAlertView * _alert;
    UIAlertView * _alertSuccess;
    UIScrollView * _scrollView;
    UIImageView * _imageView;
    UIView * _view;
    UITapGestureRecognizer * _viewTap;
    MineImageClickedView * _imageClicked;
    NewsScrollData * _scroData;
    NewsScrollView * _scroller;
    
}

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initRightButtonItem];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initRightButtonItem{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"收藏" style:UIBarButtonItemStyleDone target:self action:@selector(rightBtnClicked:)];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
        {
            
        }
            break;
        case 1:{
            
        }
        default:
            break;
    }
}

-(void)rightBtnClicked:(id)sender{
    
    
    if ([[EngineManeger shareInstance] addToDBManagerWithNewsAtEngine:_news]) {
        if (_alert == nil) {
            _alert = [[UIAlertView alloc]initWithTitle:@"收藏" message:@"收藏成功" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        }
        [_alert show];
    }
    
    
}

-(void)initWithNewsWithNews:(EngineNews *)news{
    _news = news;
    [self initUI];
    
}

-(void)initScrollView{
    

    if (_scroller == nil) {
        _scroller = [[NewsScrollView alloc] init];
        _scroller.data = [[NewsScrollData alloc] init];
    }
    
    _scroller.data.image1Name = _news.newsMatterImageNeme;
    _scroller.data.image2Name = _news.newsMatterImageName2;
    _scroller.data.image3Name = _news.newsMatterImageName3;
    _scroller.data.newsMatter1 = _news.newsMatter1;
    _scroller.data.newsMatter2 = _news.newsMatter2;
    _scroller.data.newsMatter3 = _news.newsMatter3;
    
    _scroller.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    _scroller.newsDelegate = self;
    
    [_scroller newsScrollDataUpData];
    
    [self.view addSubview:_scroller];
}

-(void)initUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = _news.newsTitle;
    [self initScrollView];
}

-(void)imageViewClicked:(UIImage *)image{
    if (_imageClicked == nil) {
        _imageClicked = [[MineImageClickedView alloc] init];
    }
    
    _imageClicked.mineImageClickedViewDelegate = self;
    _imageClicked.image = image;
    
    [_imageClicked mineImageClickedUpData];
    [self.view.window addSubview:_imageClicked];
}

-(void)mineImageClicked{
    [_imageClicked removeFromSuperview];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
