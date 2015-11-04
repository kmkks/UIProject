//
//  BasicNavViewController.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/8.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "BasicNavViewController.h"

@interface BasicNavViewController () <UINavigationControllerDelegate>{
    UILabel * _titleLable;
}

@end

@implementation BasicNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)initNavgationBar:(UIViewController*)viewController{ 
    if (![viewController.title isEqualToString:@"搜索"]) {
        viewController.navigationItem.titleView = [self creatLable:viewController];
    }
    
    
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBtn:)];
    }
    
    
}

-(void)backBtn:(id)sender{
    [self popViewControllerAnimated:YES];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    [self initNavgationBar:viewController];
    
    
    [super pushViewController:viewController animated:YES];
}

-(UILabel *)creatLable:(UIViewController*)viewController{
    UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(Screen_Width/4, 0, Screen_Width/2, 64)];
    lable.text = viewController.navigationItem.title;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = [UIColor whiteColor];
    lable.font = [UIFont fontWithName:@"TimesNewRomanPS-BoldMT" size:22];
    
    return lable;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
