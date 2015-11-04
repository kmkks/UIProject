//
//  SortViewController.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/10.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "SortViewController.h"
#import "MineTableViewCell.h"
#import "HotNewsTableViewCell.h"
#import "EngineManeger.h"
#import "EngineNews.h"
#import "HotNewsData.h"
#import "MineImageClickedView.h"
#import "NewsViewController.h"

@interface SortViewController ()<UITableViewDelegate,UITableViewDataSource,HotNewsTableViewCellDelegate,MineImageClickedDeleagte>{
    UITableView * _sotrNewsView;
    HotNewsTableViewCell * _cell;
    NSMutableArray * _newsArray;
    EngineNews * _news;
    NSMutableArray * _interest;
    MineImageClickedView * _mineImageClicked;
    NewsViewController * _sortNewsView;
}

@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)initWithNewsSort:(NSString *)sort{
    self.title = sort;
    _newsArray = [[EngineManeger shareInstance] getSortDatasWithSort:sort];
}

-(void)initUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _sotrNewsView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-108) style:UITableViewStylePlain];
    
    
    _sotrNewsView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _sotrNewsView.dataSource = self;
    _sotrNewsView.delegate = self;
    _sotrNewsView.clipsToBounds = NO;
    _sotrNewsView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _sotrNewsView.showsHorizontalScrollIndicator = NO;
    _sotrNewsView.showsVerticalScrollIndicator = NO;
    
    
    [self.view addSubview:_sotrNewsView];
}

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
    return @"删除";
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSUInteger row = [indexPath row];
    
    [_interest addObject:[_newsArray objectAtIndex:row]];
    
    [_newsArray removeObjectAtIndex:row];
    
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
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

    if (_sortNewsView == nil) {
        _sortNewsView = [[NewsViewController alloc] init];
    }

    
    HotNewsTableViewCell * cell = (HotNewsTableViewCell*)[_sotrNewsView cellForRowAtIndexPath:indexPath];
    
    for (int index = 0; index < _newsArray.count ;index++) {
        if ([cell.data.newsId isEqualToNumber:((EngineNews*)[_newsArray objectAtIndex:(NSUInteger)index]).newsId]) {
            [_sortNewsView initWithNewsWithNews:((EngineNews*)[_newsArray objectAtIndex:(NSUInteger)index])];
            break;//防止相同数据重复绘制;
        }
    }
    
    [self.navigationController pushViewController:_sortNewsView animated:YES];
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
