//
//  MineTableViewCell.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/9.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "MineTableViewCell.h"

@interface MineTableViewCell(){
    UIImageView * _imageView;
    UILabel * _title;
}

@end

@implementation MineTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}

-(void)initUI{
    
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 80)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.userInteractionEnabled = YES;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    
    _title = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_imageView.frame)+10, bgView.frame.size.height/2-44/2,100, 44)];
    
    [bgView addSubview:_imageView];
    
    [bgView addSubview:_title];
    
    UIView * downLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView.frame)-0.5, Screen_Width, 0.5)];
    downLine.backgroundColor = [UIColor colorWithRed:194/255.0f green:194/255.0f blue:194/255.0f alpha:1.0];
    [bgView addSubview:downLine];
    
    [self.contentView addSubview:bgView];
    
}



-(void)updateMineCell{
    _imageView.image = [UIImage imageNamed:_data.imageName];
    _title.text = _data.titleName;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
