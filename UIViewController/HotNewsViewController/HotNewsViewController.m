//
//  HotNewsViewController.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/9.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "HotNewsViewController.h"
#import "EngineManeger.h"
#import "EngineNews.h"
#import "NewsViewController.h"
#import "HotNewsTableViewCell.h"
#import "HotNewsData.h"
#import "NewsScrollView.h"
#import "MineImageClickedView.h"

@interface HotNewsViewController ()<UITableViewDataSource,UITableViewDelegate,HotNewsTableViewCellDelegate,MineImageClickedDeleagte>{
    UITableView * _newsHotTableView;
    UIButton * _newsrefurbish;
    UIActivityIndicatorView * _act;
    NSMutableArray * _newsArray;
    HotNewsTableViewCell * _cell;
    EngineNews * _news;
    HotNewsData * _hotNewsData;
    UIImageView * _imageView;
    NSString * _imageStr;
    UIView * _view;
    UITapGestureRecognizer * _viewTap;
    MineImageClickedView * _mineImageClicked;
    NSMutableArray * _newNewsData;
    NewsViewController * _hotNewsView;
}

@end

@implementation HotNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getDataSource];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self initUI];
    
    [self initRightBarButtonItem];
}

-(void)getDataSource{
    _newsArray = [[EngineManeger shareInstance] getNewsDataSource];
}

-(void)initRightBarButtonItem{
    if (self.navigationItem.rightBarButtonItem == nil) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStyleDone target:self action:@selector(rightBtnClicked:)];
    }
    
}

-(void)initUI{
    if (_newsHotTableView == nil) {
        _newsHotTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-108) style:UITableViewStylePlain];
        
        _newsHotTableView.backgroundColor = [UIColor whiteColor];
        _newsHotTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _newsHotTableView.dataSource = self;
        _newsHotTableView.delegate = self;
        _newsHotTableView.clipsToBounds = NO;
        _newsHotTableView.showsHorizontalScrollIndicator = NO;
        _newsHotTableView.showsVerticalScrollIndicator = NO;
        
    }

    [self.view addSubview:_newsHotTableView];
}

-(void)refurbish:(id)sender{
    
}

-(void)getTableViewCelllNewNewsData{
    
    
    if (_newNewsData != nil) {
        
        [_newNewsData removeAllObjects];
        _newNewsData = nil;
        
    }
    
    _newNewsData = [[EngineManeger shareInstance] getNewNewsData];
    if (_newNewsData && _newNewsData.count > 0) {
        
        for (int index = 0;index < _newNewsData.count ; index++) {
            
            [_newsArray insertObject:[_newNewsData objectAtIndex:(NSUInteger)index] atIndex:index];
            
        }
        
    }
    
}

-(void)rightBtnClicked:(id)sender{
    [self getTableViewCelllNewNewsData];
    
    [_newsHotTableView reloadData];
}

#pragma mark-UITableViewDataSource

-(void)removeAllCellFromTableView:(UITableView*)tableView{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_newsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellName =@"cellName";
    
    _cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (_cell == nil) {
        _cell = [[HotNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
        _cell.data = [[HotNewsData alloc] init];
    }
    _news = [_newsArray objectAtIndex:indexPath.row];
    if (indexPath.row >= 0 && indexPath.row < _newsArray.count) {
        
        _cell.data.imageName = _news.newsImageName;
        _cell.data.lableTitle = _news.newsTitle;
        _cell.data.labeleDetailTextLabel = _news.newsSubhead;
        _cell.data.newsId = _news.newsId;
        
        _cell.delegate = self;
    }
    
    [_cell updateHotNewsCell];
    
    return _cell;
}

-(void)tapClicked:(id)sender{
    
}

#pragma mark-UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"不再关注";
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSUInteger row = [indexPath row];
    
    [_newsArray removeObjectAtIndex:row];
    
    [_newsHotTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}


-(void)hotNewsCellClicked:(UIImage*)image{
    
    if (_mineImageClicked == nil) {
        _mineImageClicked = [[MineImageClickedView alloc] init];
    }
    _mineImageClicked.mineImageClickedViewDelegate = self;
    _mineImageClicked.image = image;
 
    [_mineImageClicked mineImageClickedUpData];
    
    [self.view.window addSubview:_mineImageClicked];
}

-(void)mineImageClicked{
    [_mineImageClicked removeFromSuperview];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _hotNewsView = [[NewsViewController alloc] init];
    
    HotNewsTableViewCell * cell = (HotNewsTableViewCell*)[_newsHotTableView cellForRowAtIndexPath:[_newsHotTableView indexPathForSelectedRow]];
    
    for (int index = 0; index < _newsArray.count ;index++) {
        if ([cell.data.newsId isEqualToNumber:((EngineNews*)[_newsArray objectAtIndex:(NSUInteger)index]).newsId]) {
            [_hotNewsView initWithNewsWithNews:((EngineNews*)[_newsArray objectAtIndex:(NSUInteger)index])];
            break;//防止相同数据重复绘制;
        }
    }
   
    
    [self.navigationController pushViewController:_hotNewsView animated:YES];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardS
 egue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
