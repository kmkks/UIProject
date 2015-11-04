//
//  BasicTabBarViewController.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/8.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "BasicTabBarViewController.h"
#import "HotNewsViewController.h"
#import "BasicNavViewController.h"
#import "MineViewController.h"
#import "SearchNewsViewController.h"
#import "SortNewsViewController.h"
#import "MineSearchViewController.h"

@interface BasicTabBarViewController (){

}

@end

@implementation BasicTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTabBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)initTabBar{
    HotNewsViewController * hotView = [[HotNewsViewController alloc] init];
    [self addChindVC:hotView title:@"今日热点" imageName:@"" selectImageName:@""];
    
    SortNewsViewController * sortView = [[SortNewsViewController alloc] init];
    [self addChindVC:sortView title:@"兴趣" imageName:@"" selectImageName:@""];
    
    SearchNewsViewController * searchView = [[SearchNewsViewController alloc] init];
    [self addChindVC:searchView title:@"搜索" imageName:@"" selectImageName:@""];
    
    MineViewController * mineView = [[MineViewController alloc]init];
    [self addChindVC:mineView title:@"个人中心" imageName:@"" selectImageName:@""];
    
}

-(void)addChindVC:(UIViewController*)vc title:(NSString*)title imageName:(NSString*)imageName selectImageName:(NSString*)selectImageName{
    
    vc.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.view.backgroundColor = [UIColor whiteColor];
    
    BasicNavViewController * Navi = [[BasicNavViewController alloc] initWithRootViewController:vc];

    Navi.navigationBar.barTintColor = UIColorWithRGB(256, 27, 13);
    
    Navi.navigationBar.tintColor = [UIColor whiteColor];
    
    [self addChildViewController:Navi];
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
