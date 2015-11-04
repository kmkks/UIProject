
//
//  HotNewsTableViewCell.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/10.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "HotNewsTableViewCell.h"
#import "HotNewsData.h"
@interface HotNewsTableViewCell()<UITableViewDelegate>{
    UIImageView * _imageView;
    UIView * _bgView;
}

@end

@implementation HotNewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}

-(void)initUI{
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 80)];
    
    _bgView.backgroundColor = [UIColor whiteColor];
    
    
    _labeleTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, _bgView.frame.size.height/2-44,Screen_Width-100, 44)];
    _labeleTitle.font = [UIFont systemFontOfSize:22];
    _labeleDetailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, _bgView.frame.size.height/2-20, Screen_Width-100, 60)];
    _labeleDetailTextLabel.font = [UIFont systemFontOfSize:12];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_labeleTitle.frame),10, 80, 60)];
    
    _imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellClicked:)];
    
    [_imageView addGestureRecognizer:tap];
    
    [_bgView addSubview:_labeleTitle];
    [_bgView addSubview:_labeleDetailTextLabel];
    [_bgView addSubview:_imageView];
    UIView * downLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_bgView.frame)-0.5, Screen_Width, 0.5)];
    downLine.backgroundColor = [UIColor colorWithRed:194/255.0f green:194/255.0f blue:194/255.0f alpha:1.0];
    [_bgView addSubview:downLine];
    
    
    self.accessoryType = UITableViewCellAccessoryNone;
    
    
    [self.contentView addSubview:_bgView];
}


-(void)cellClicked:(id)sender{
    if (sender && [sender isKindOfClass:[UITapGestureRecognizer class]]) {
        if (_delegate && [_delegate respondsToSelector:@selector(hotNewsCellClicked:)]) {
            
            
            UITapGestureRecognizer* tap = (UITapGestureRecognizer*)sender;
            
            UIImageView* imageView = (UIImageView*)tap.view;
            
            [_delegate hotNewsCellClicked:imageView.image];
        }
    }
}

-(void)updateHotNewsCell{
    _imageView.image = [UIImage imageNamed:_data.imageName];
    _labeleTitle.text = _data.lableTitle;
    _labeleDetailTextLabel.text = _data.labeleDetailTextLabel;
}


@end
