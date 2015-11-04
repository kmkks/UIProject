//
//  News.h
//  UIProject
//
//  Created by 中软mini012 on 15/10/14.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface News : NSManagedObject

@property (nonatomic, retain) NSNumber * newsId;
@property (nonatomic, retain) NSString * newsImageName;
@property (nonatomic, retain) NSString * newsMatter1;
@property (nonatomic, retain) NSString * newsMatter2;
@property (nonatomic, retain) NSString * newsMatter3;
@property (nonatomic, retain) NSString * newsMatterImageName2;
@property (nonatomic, retain) NSString * newsMatterImageName3;
@property (nonatomic, retain) NSString * newsMatterImageNeme;
@property (nonatomic, retain) NSString * newsSort;
@property (nonatomic, retain) NSString * newsSubhead;
@property (nonatomic, retain) NSString * newsTitle;
@property (nonatomic, retain) NSNumber * userId;

@end
