
//
//  SortNewsViewController.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/9.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "SortNewsViewController.h"
#import "SortManageViewController.h"
#import "EngineNews.h"
#import "EngineManeger.h"
#import "MineTableViewCell.h"
#import "MineData.h"
#import "NewsViewController.h"
#import "SortViewController.h"
#import "SortNewsScrollView.h"

@interface SortNewsViewController ()<UITableViewDataSource,UITableViewDelegate,SortNewsScrollViewDelegate>{
    UITableView * _sortNewsView;
    MineData * _news;
    NSMutableArray * _newsArray;
    MineTableViewCell * _cell;
    MineData * _mineData;
    SortManageViewController * _sortManage;
    SortNewsScrollView * _sortNewsScrollView;
    NSMutableArray * _sortNewsScrollViewData;
}

@end

@implementation SortNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getSortScrollViewData];
    
    [self getSotrTableViewSortData];
    
    [self initUI];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getSotrTableViewSortData{
    
    _newsArray = [[EngineManeger shareInstance] getSortDatas];
    
}

-(void)getSortScrollViewData{
    if (_sortNewsScrollViewData == nil) {
        _sortNewsScrollViewData = [[NSMutableArray alloc] init];
    }
    _sortNewsScrollViewData = [NSMutableArray arrayWithObjects:@"科技",@"国际",@"娱乐",@"历史",@"探索",@"社会",@"数码",@"段子", nil];
}

-(void)initUI{
    if (_sortNewsScrollView == nil) {
        _sortNewsScrollView = [[SortNewsScrollView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, 25)];
        [_sortNewsScrollView initWithLableTitltArray:_sortNewsScrollViewData];
        
        _sortNewsScrollView.sortNewsScrollViewDelegate = self;
    }
    
    _sortNewsView =[[UITableView alloc]initWithFrame:CGRectMake(0, 89, Screen_Width, Screen_Height-133) style:UITableViewStylePlain];
    
    _sortNewsView.backgroundColor = [UIColor blueColor];
    _sortNewsView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _sortNewsView.dataSource = self;
    _sortNewsView.delegate = self;
    _sortNewsView.clipsToBounds = NO;
    _sortNewsView.showsHorizontalScrollIndicator = NO;
    _sortNewsView.showsVerticalScrollIndicator = NO;
    
    
    [self.view addSubview:_sortNewsView];
    [self.view addSubview:_sortNewsScrollView];
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
        _cell = [[MineTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
        _cell.data = [[MineData alloc] init];
    }
    _news = [_newsArray objectAtIndex:indexPath.row];
    if (indexPath.row >= 0 && indexPath.row < _newsArray.count) {
        
        _cell.data.titleName = _news.titleName;
        _cell.data.imageName = _news.imageName;
        _cell.data.newsId = _news.newsId;
        
    }
    
    [_cell updateMineCell];
    
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
    
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SortViewController * newsView = [[SortViewController alloc] init];
    
    MineTableViewCell * cell = (MineTableViewCell*)[_sortNewsView cellForRowAtIndexPath:indexPath];

    [newsView initWithNewsSort:cell.data.titleName];
    
    [self.navigationController pushViewController:newsView animated:YES];
}

-(void)sortNewsScrollViewBtnClicked:(UIButton *)button{
    
}

-(void)sortNewsScrollViewLableClicked:(UILabel *)labletext{
    
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
