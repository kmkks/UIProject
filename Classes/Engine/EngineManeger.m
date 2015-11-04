//
//  EngineManeger.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/8.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "EngineManeger.h"
#import "EngineNews.h"
#import "DBManager.h"
#import "DBManager+Manipulate.h"
#import "MineData.h"

@interface EngineManeger(){
    NSArray * _arr;
    NSArray * _arrNews;
    NSMutableDictionary * _dicNews;
    NSMutableDictionary * _dicMine;
    NSMutableArray * _newsDataSourceArr;
    NSMutableArray * _newsSortArr;
    NSMutableArray * _newNewsData;
    NSMutableArray * _sortViewNews;
    NSMutableArray * _sortNewsWithSort;
    NSMutableArray * _sortNews;
}

@end

@implementation EngineManeger

static EngineManeger * instance = nil;

+(id)shareInstance{
    @synchronized(self){
        if (instance == nil) {
            instance = [[EngineManeger alloc]init];
        }
    }
    
    return instance;
}

-(NSMutableArray*)getNewsSort{
    if (_newsSortArr == nil) {
        _newsSortArr = [[NSMutableArray alloc] init];
    }
    
    return _newsSortArr;
}

-(NSMutableArray *)getSortNewsData:(id)sender{

    NSMutableArray * arr = [self getNewsDataSource];
    
    NSMutableArray * sortsArr = [[NSMutableArray alloc] init];
    for (int index = 0; index < arr.count; index ++) {
        if ([(NSString *)sender isEqualToString:((EngineNews *)[arr objectAtIndex:index]).newsSort]) {
            [sortsArr addObject:(EngineNews *)[arr objectAtIndex:index]];
        }
    }
    
    return arr;
}

-(NSMutableArray*)getNewNewsData{
    if (_newNewsData == nil) {
        _newNewsData = [[NSMutableArray alloc] init];
    }
    
    EngineNews * news1 = [[EngineNews alloc] init];
    news1.newsId = [NSNumber numberWithInt:1];
    news1.newsTitle = @"新闻1";
    news1.newsSort = @"科技";
    news1.newsSubhead = @"Iphone";
    news1.newsMatterImageNeme = @"新闻1_2.png";
    news1.newsMatterImageName2 = @"新闻1_3.png";
    news1.newsMatter1 = @"/Users/zhongruanmini012/Library/Developer/CoreSimulator/Devices/3C2A589F-FD52-4C8E-8BB6-BA404E154921/data/Containers/Data/Application/D75A56D2-63A0-4911-A1E9-E378C7B55603";
    news1.newsImageName = @"新闻1_1.png";
    
    [_newNewsData addObject:news1];
    
    return _newNewsData;
}

-(NSMutableArray*)getNewsDataSource{
    if (_dicMine != nil) {
        [_dicMine removeAllObjects];
        _dicMine = nil;
    }
    if (_dicNews == nil) {
        _dicNews = [[NSMutableDictionary alloc] init];
    }
    if (_newsDataSourceArr != nil) {
        [_newsDataSourceArr removeAllObjects];
        _newsDataSourceArr = nil;
    }
    
    if (_newsDataSourceArr == nil) {
        _newsDataSourceArr = [[NSMutableArray alloc] init];
    }
    EngineNews * news1 = [[EngineNews alloc] init];
    news1.newsId = [NSNumber numberWithInt:1];
    news1.newsTitle = @"新闻1";
    news1.newsSort = @"科技";
    news1.newsSubhead = @"Iphone";
    news1.newsMatterImageNeme = @"新闻1_2.png";
    news1.newsMatterImageName2 = @"新闻1_3.png";
    news1.newsMatter1 = @"/Users/zhongruanmini012/Library/Developer/CoreSimulator/Devices/3C2A589F-FD52-4C8E-8BB6-BA404E154921/data/Containers/Data/Application/D75A56D2-63A0-4911-A1E9-E378C7B55603";
    news1.newsImageName = @"新闻1_1.png";
    
    [_newsDataSourceArr addObject:news1];
    
    EngineNews * news2 = [[EngineNews alloc] init];
    news2.newsId = [NSNumber numberWithInt:2];
    news2.newsTitle = @"新闻2";
    news2.newsSort = @"娱乐";
    news2.newsSubhead = @"明星";
    news2.newsMatterImageNeme = @"新闻2_2.png";
    news2.newsMatterImageName2 = @"新闻2_3.png";
    news2.newsMatter1 = @"045asdwfads,awe.awd?aw";
    news2.newsImageName = @"新闻2_1.png";
    news2.newsMatter2 = @"asdawdsd";
    
    [_newsDataSourceArr addObject:news2];
    
    EngineNews * news3 = [[EngineNews alloc] init];
    news3.newsId = [NSNumber numberWithInt:3];
    news3.newsTitle = @"新闻3";
    news3.newsSort = @"国际";
    news3.newsSubhead = @"美国";
    news3.newsMatterImageNeme = @"新闻3_2.png";
    news3.newsMatterImageName2 = @"新闻3_3.png";
    news3.newsMatter1 = @"045aweasfre80ads,awe.awd?aw";
    news3.newsImageName = @"新闻3_1.png";
    news3.newsMatter2 = @"asdawdsd";
    news3.newsMatter3 = @"dawvgwseeg";
    
    [_newsDataSourceArr addObject:news3];
    
    EngineNews * news4 = [[EngineNews alloc] init];
    news4.newsId = [NSNumber numberWithInt:4];
    news4.newsTitle = @"新闻4";
    news4.newsSort = @"国际";
    news4.newsSubhead = @"美国";
    news4.newsMatterImageNeme = @"新闻4_2.png";
    news4.newsMatterImageName2 = @"新闻4_3.png";
    news4.newsMatter1 = @"a ye5enavtw43q5w4c4xta5eatye CEGSEAVCSRGDR";
    news4.newsImageName = @"新闻4_1.png";
    news4.newsMatter2 = @"有图片名但是没图片";
    news4.newsMatter3 = @"vheaev5sec4ra4qservagvw wvw,savwawvr";
    
    [_newsDataSourceArr addObject:news4];
    
    EngineNews * news5 = [[EngineNews alloc] init];
    news5.newsId = [NSNumber numberWithInt:5];
    news5.newsTitle = @"新闻5";
    news5.newsSort = @"国际";
    news5.newsSubhead = @"美国";
    news5.newsMatterImageNeme = @"新闻5_2.png";
    news5.newsMatterImageName2 = @"新闻5_3.png";
    news5.newsMatter1 = @"有图片名但是没图片 asdfargwedfawef";
    news5.newsImageName = @"新闻5_1.png";
    news5.newsMatter2 = @"aaesfabfdra.vsaed";
    news5.newsMatter3 = @"aestynaqb,,,teavgwseeg";
    
    [_newsDataSourceArr addObject:news5];
    
//    [_dicNews setValue:_ma1 forKey:@"array1"];
    
    return _newsDataSourceArr;
}

-(NSMutableArray *)getSortDatas{
    if (_sortNews != nil) {
        [_sortNews removeAllObjects];
        _sortNews = nil;
    }
    if (_sortNews == nil) {
        _sortNews = [[NSMutableArray alloc] init];
    }
    
    
    
    return _sortNews;
}

-(NSMutableArray *)getSortViewDatas{
    if (_sortViewNews == nil) {
        _sortViewNews = [[NSMutableArray alloc] init];
    }
    
    MineData * mineData1 = [[MineData alloc] init];
    mineData1.imageName = @"科技.png";
    mineData1.titleName = @"科技";
    
    [_sortViewNews addObject:mineData1];
    
    MineData * mineData2 = [[MineData alloc] init];
    mineData2.imageName = @"娱乐.png";
    mineData2.titleName = @"娱乐";
    
    [_sortViewNews addObject:mineData2];
    
    MineData * mineData3 = [[MineData alloc] init];
    mineData3.imageName = @"国际.png";
    mineData3.titleName = @"国际";
    
    [_sortViewNews addObject:mineData3];
    
    return _sortViewNews;
}

-(NSMutableDictionary*)getMineDataSource{
    return _dicMine;
}



-(NSMutableArray*)getSortDatasWithSort:(NSString *)sort{
    if (_sortNewsWithSort != nil) {
        [_sortNewsWithSort removeAllObjects];
        _sortNewsWithSort = nil;
    }
    
    if (_sortNewsWithSort == nil) {
        _sortNewsWithSort = [[NSMutableArray alloc] init];
    }
    NSMutableArray * newsArr = [self getNewsDataSource];
    
    for (EngineNews * news in newsArr) {
        if ([news.newsSort isEqualToString:sort]) {
            [_sortNewsWithSort addObject:news];
        }
    }
    
    return _sortNewsWithSort;
}

-(BOOL)addToDBManagerWithNewsAtEngine:(id)sender{
    if (sender && [sender isKindOfClass:[EngineNews class]]) {
        [[DBManager shareInstance] addToDBManagerWithNews:sender];
        return YES;
    }
    return NO;
}

-(BOOL)removeFromDBManagerWithNews:(id)sender{
    if (sender && [sender isKindOfClass:[EngineNews class]]) {
        [[DBManager shareInstance] removeFromDBManager:sender];
    }
    return NO;
}

-(id)fetchNewsTitleOrMatterFromDB:(id)sender{
    if (sender && [sender isKindOfClass:[NSString class]]) {
        _arr = [[DBManager shareInstance] fetchNewsTitleOrMatter:(NSString *)sender];
    }
    return _arr;
}

-(NSArray *)fetchDataNewsIdFromDBManager:(id)sender{
    if (sender && [sender isKindOfClass:[NSNumber class]]) {
        
        _arr = [[DBManager shareInstance] fetchDataNewsId:(NSNumber *)sender];
        
    }
    return _arr;
}

-(NSArray *)fetchDataNewsSortWithUserIdFromDBManager:(id)sender{
    if (sender && [sender isKindOfClass:[NSNumber class]]) {
        _arr = [[DBManager shareInstance] fetchDataNewsSortWithUserId:(NSNumber *)sender];
    }
    return _arr;
}

-(id)fetchfromDBManager:(NSString *)sender{
    if (sender && [sender isKindOfClass:[NSString class]]) {
        _arr = [[DBManager shareInstance] fetchDataNewsId:sender];
    }
    return _arr;
}

-(EngineNews*)fetchNewsFromEngine:(NSNumber*)sender{
    for (EngineNews * news in _newsDataSourceArr) {
        if (sender == news.newsId) {
            return news;
        }
    }
    return nil;
}

@end
