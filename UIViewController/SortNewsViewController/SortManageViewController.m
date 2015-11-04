//
//  SortManageViewController.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/13.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "SortManageViewController.h"
#import "MineTableViewCell.h"
#import "MineData.h"
#import "EngineNews.h"
#import "EngineManeger.h"

@interface SortManageViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView * _sotrNewsView;
    MineTableViewCell * _cell;
    NSMutableArray * _newsArray;
    MineData * _news;
    UITableViewCell * _selectCell;
}

@end

@implementation SortManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

-(void)initUI{
    _sotrNewsView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-108) style:UITableViewStylePlain];
    
    _sotrNewsView.backgroundColor = [UIColor whiteColor];
    _sotrNewsView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _sotrNewsView.dataSource = self;
    _sotrNewsView.delegate = self;
    _sotrNewsView.clipsToBounds = NO;
    _sotrNewsView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _sotrNewsView.showsHorizontalScrollIndicator = NO;
    _sotrNewsView.showsVerticalScrollIndicator = NO;
    
    
    [self.view addSubview:_sotrNewsView];
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
    }
    
    [_cell updateMineCell];
    
    return _cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_newsArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"添加";
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSUInteger row = [indexPath row];
    
    _selectCell = [_sotrNewsView cellForRowAtIndexPath:indexPath];
    
    [_newsArray removeObjectAtIndex:row];
    
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
