//
//  User.h
//  UIProject
//
//  Created by 中软mini012 on 15/10/14.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * userPwd;

@end
