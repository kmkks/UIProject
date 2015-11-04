//
//  DBManager+Manipulate.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/8.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "DBManager+Manipulate.h"
#import "News.h"
#import "EngineNews.h"
#import "EngineUser.h"
#import "EngineNewsSort.h"

@implementation DBManager (Manipulate)

-(BOOL)repeatQuery:(id)sender{
    if (sender && [sender isKindOfClass:[EngineNews class]]) {
        EngineNews * en1 = (EngineNews *) sender;
        NSString * str = [[NSString alloc] initWithFormat:@"newsId='%@'",en1.newsId];
        NSArray * lists = [self checkTable:@"News" andCondition:str];
        if (lists && lists.count>0) {
            return NO;
        }
    }
    return YES;
}

-(BOOL)addToDBManagerWithNews:(id)sender{
    if (sender && [sender isKindOfClass:[EngineNews class]] && [self repeatQuery:sender]) {
        EngineNews * en1 = (EngineNews * )sender;
        News * u1 = [NSEntityDescription insertNewObjectForEntityForName:@"News" inManagedObjectContext:self.managedObjectContext];
        u1.newsId = en1.newsId;
        u1.newsImageName = en1.newsImageName;
        u1.newsTitle = en1.newsTitle;
        u1.newsMatter1 = en1.newsMatter1;
        u1.newsSort = en1.newsSort;
        u1.newsSubhead = en1.newsSubhead;
        u1.newsMatterImageNeme = en1.newsMatterImageNeme;
        u1.newsMatterImageName2 = en1.newsMatterImageName2;
        u1.newsMatterImageName3 = en1.newsMatterImageName3;
        u1.newsMatter2 = en1.newsMatter2;
        u1.newsMatter3 = en1.newsMatter3;
        
        [self saveContext];
        return YES;
    }
    return NO;
}

-(BOOL)removeFromDBManager:(id)sender{
    
    if (sender && [sender isKindOfClass:[EngineNews class]]){
        
        EngineNews * en1 = (EngineNews * )sender;
        
        NSString * str = [[NSString alloc] initWithFormat:@"newsId='%@'",en1.newsId];
        
        NSArray * lists = [self checkTable:@"News" andCondition:str];
        
        if (lists && lists.count>0) {
            
            for (id obj in lists) {
                
                [self.managedObjectContext deleteObject:obj];
            }
            
            [self saveContext];
            
            return YES;
            
        }
        
    }
    
    return NO;
}

-(BOOL)removeNewsSortInsteresedWithUserId:(id)sender{
    
    if (sender && [sender isKindOfClass:[EngineNewsSort class]]) {
        
        EngineNewsSort * sort = (EngineNewsSort *)sender;
        
        NSString * userId = [NSString stringWithFormat:@"userId='%@' AND sort='%@'",sort.userId,sort.sort];
        
        NSArray * lists = [self checkTable:@"NewsSort" andCondition:userId];
        
        if (lists != nil) {
            for (id newsSort in lists) {
                
                [self.managedObjectContext deleteObject:newsSort];                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                
            }
        }
        
        
    }
    
    return NO;
}

-(NSArray * )fetchNewsTitleOrMatter:(NSString*)sender{
    
    static NSMutableArray * arr = nil;
    
    if (arr == nil) {
        
        arr = [[NSMutableArray alloc] init];
        
    }
    
    NSString * str = [[NSString alloc] initWithFormat:@"newsTitle CONTAINS '%@'",sender];
    
    NSArray * lists = [self checkTable:@"News" andCondition:str];
    
    if (lists && lists.count>0) {
        
        for (News * obj in lists) {
            
            [arr addObject:obj];
            
        }
        
    }
    
    return arr;
}

-(NSArray*)fetchDataNewsId:(id)sender{
    
    if (sender && [sender isKindOfClass:[NSNumber class]]){
        
        NSString * str = [[NSString alloc] initWithFormat:@"newsId='%@'",sender];
        
        if ([sender isEqualToString:@"ALL"]) {
            
            str = nil;
            
        }
        
        NSArray * lists = [self checkTable:@"News" andCondition:str];
        
        NSMutableArray * _ma1;
        
        if (_ma1 != nil) {
            
            [_ma1 removeAllObjects];
            
            _ma1 = nil;
            
        }
        
        _ma1 = [[NSMutableArray alloc]init];
        
        if (lists && lists.count>0) {
            
            for (News * obj in lists) {
                
                [_ma1 addObject:obj];
                
            }
            
            return _ma1;
        }
    }
    
    return nil;
}

-(NSArray*)fetchDataUserId:(NSNumber*)sender{
    
    if (sender && [sender isKindOfClass:[NSNumber class]]) {
        
        NSString * str = [[NSString alloc] initWithFormat:@"userId='%@'",sender];
        
        NSArray * lists = [self checkTable:@"User" andCondition:str];
        
        NSMutableArray * _ma1;
        
        if (_ma1 != nil) {
            [_ma1 removeAllObjects];
            _ma1 = nil;
        }
        
        _ma1 = [[NSMutableArray alloc]init];
        
        if (lists && lists.count>0) {
            for (News * obj in lists) {
                [_ma1 addObject:obj];
            }
            return _ma1;
        }
    }
    
    return nil;
}

-(NSArray *)fetchDataNewsSortWithUserId:(NSNumber *)sender{
    
    if (sender && [sender isKindOfClass:[NSNumber class]]) {
        
        NSString * str = [[NSString alloc] initWithFormat:@"userId='%@'",sender];
        
        NSArray * lists = [self checkTable:@"NewsSort" andCondition:str];
        
        NSMutableArray * _ma1;
        
        if (_ma1 != nil) {
            [_ma1 removeAllObjects];
            _ma1 = nil;
        }
        
        _ma1 = [[NSMutableArray alloc]init];
        
        if (lists && lists.count>0) {
            for (News * obj in lists) {
                [_ma1 addObject:obj];
            }
            return _ma1;
        }
        
    }
    
    return nil;
}

-(id)checkTable:(NSString *)table andCondition:(NSString *)str{
    
    NSFetchRequest * fetch = [[NSFetchRequest alloc] initWithEntityName:table];
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat:str];
    
    [fetch setPredicate:predicate];
    
    NSError * err = nil;
    
    NSArray * lists = [self.managedObjectContext executeFetchRequest:fetch error:&err];
    
    if (lists && lists.count >0) {
        
        return lists;
        
    }
    
    return nil;
}

@end
