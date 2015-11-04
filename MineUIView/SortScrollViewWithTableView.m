//
//  SortScrollViewWithTableView.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/16.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "SortScrollViewWithTableView.h"
#import "MineTableViewCell.h"
#import "EngineManeger.h"

@interface SortScrollViewWithTableView ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray * _sortsArray;
    UIView * _sortsView;
    MineTableViewCell * _sortTableViewCell;
    NSMutableArray * _sortNewsData;
}

@end

@implementation SortScrollViewWithTableView

-(NSMutableArray *)getSortNewsFromEngine:(NSString *)sort{
    _sortNewsData = [[EngineManeger shareInstance] getSortNewsData:sort];
    return _sortNewsData;
}

-(void)initWithSortsArray:(NSMutableArray *)sortsArray{
    _sortsArray = sortsArray;
}

-(void)initUI{
    if (_sortsView == nil) {
        _sortsView = [[UIView alloc] init];
    }
    
    _sortsView.frame = CGRectMake(0, 0, Screen_Width*_sortsArray.count, Screen_Height-133);
    
    for (int index = 0; index < _sortsArray.count; index++) {
        
        
    }
    
    
}

-(UITableView *)creatTableViewWithSort:(NSString *)sort andFrame:(CGRect)frame{
    UITableView * table = [[UITableView alloc] initWithFrame:frame];
    table.showsHorizontalScrollIndicator = NO;
    table.showsVerticalScrollIndicator = NO;
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    return table;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _sortNewsData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return _sortTableViewCell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
