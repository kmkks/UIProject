//
//  MineTableViewCell.h
//  UIProject
//
//  Created by 中软mini012 on 15/10/9.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineData.h"

@protocol MineTableViewCellDelegate <NSObject>

@required
-(void)btnClicked:(id)sender;

@end
@interface MineTableViewCell : UITableViewCell

@property(nonatomic,strong)MineData * data;

@property(nonatomic,weak)id<MineTableViewCellDelegate> delegate;

-(void)updateMineCell;

@end
