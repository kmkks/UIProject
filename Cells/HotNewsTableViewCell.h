//
//  HotNewsTableViewCell.h
//  UIProject
//
//  Created by 中软mini012 on 15/10/10.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HotNewsData;


@protocol HotNewsTableViewCellDelegate <NSObject>

@required
-(void)hotNewsCellClicked:(UIImage*)image;



@end
@interface HotNewsTableViewCell : UITableViewCell

@property(nonatomic,strong)HotNewsData * data;

@property(nonatomic,weak)id<HotNewsTableViewCellDelegate> delegate;

@property(nonatomic,copy)NSIndexPath * indexPath;

-(void)updateHotNewsCell;

@property(nonatomic,copy)UILabel * labeleTitle;

@property(nonatomic,copy) UILabel * labeleDetailTextLabel;

@end
