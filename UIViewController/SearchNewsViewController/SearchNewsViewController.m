//
//  SearchNewsViewController.m
//  UIProject
//
//  Created by 中软mini012 on 15/10/9.
//  Copyright (c) 2015年 中软mini012. All rights reserved.
//

#import "SearchNewsViewController.h"

@interface SearchNewsViewController ()<UISearchBarDelegate>{
    UISearchBar * _searchBar;
    UITapGestureRecognizer * _viewtap;
}

@end

@implementation SearchNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_searchBar setShowsCancelButton:NO animated:YES];
}

-(void)initUI{
    
    if (_searchBar == nil) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(Screen_Width/2-50, 0, 80, 100)];
        _searchBar.delegate = self;
        
    }
    
    if (_viewtap == nil) {
        _viewtap = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(viewClicked:)];
    }
    
    [self.view addGestureRecognizer:_viewtap];
    self.navigationItem.titleView = _searchBar;
    
}

-(void)viewClicked:(id)sender{
    [_searchBar setShowsCancelButton:NO animated:YES];
    [_searchBar resignFirstResponder];
}

#pragma mark-UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [_searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [_searchBar resignFirstResponder];
    [_searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [_searchBar resignFirstResponder];
    [_searchBar setShowsCancelButton:NO animated:YES];
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
