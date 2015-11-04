//
//  EngineManeger.h
//  UIProject
//
//  Created by 中软mini012 on 15/10/8.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EngineNews;
@interface EngineManeger : NSObject

+(id)shareInstance;

-(BOOL)addToDBManagerWithNewsAtEngine:(id)sender;

-(BOOL)removeFromDBManagerWithNews:(id)sender;

-(id)fetchNewsTitleOrMatterFromDB:(NSString *)sender;

-(id)fetchfromDBManager:(NSString *)sender;

-(EngineNews*)fetchNewsFromEngine:(NSNumber*)sender;

-(NSMutableArray*)getNewsDataSource;

-(NSMutableArray *)getSortNewsData:(id)sender;

-(NSMutableDictionary*)getMineDataSource;

-(NSMutableArray*)getNewNewsData;

-(NSMutableArray *)getSortDatas;

-(NSMutableArray*)getSortDatasWithSort:(NSString *)sort;

-(NSArray *)fetchDataNewsIdFromDBManager:(id)sender;

-(NSArray *)fetchDataNewsSortWithUserIdFromDBManager:(id)sender;

@end
