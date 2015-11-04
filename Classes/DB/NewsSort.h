//
//  NewsSort.h
//  UIProject
//
//  Created by 中软mini012 on 15/10/14.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface NewsSort : NSManagedObject

@property (nonatomic, retain) NSString * sort;
@property (nonatomic, retain) NSNumber * if_Interested;
@property (nonatomic, retain) NSNumber * userId;

@end
