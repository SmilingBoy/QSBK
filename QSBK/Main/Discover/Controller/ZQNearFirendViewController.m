//
//  ZQNearFirendViewController.m
//  QSBK
//
//  Created by lx on 16/5/21.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQNearFirendViewController.h"
#import "ZQNearFriendCell.h"

@interface ZQNearFirendViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak)UITableView *tableView;


@end

@implementation ZQNearFirendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavBarButton];
    
    [self setUpTableView];
    
}

- (void)setUpNavBarButton{
    
    //左侧返回按钮定制
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    leftButton.frame = CGRectMake(0, 0, 100, 50);
    [leftButton setTitle:@"附近糗友" forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"abc_ic_ab_back_holo_dark"] forState:UIControlStateNormal];
    
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0);
    leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0);
    
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
}

- (void)leftButtonClick:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)setUpTableView{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    _tableView = tableView;
    
    [self.view addSubview:_tableView];
    
}

#pragma  mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuserIndentifier = @"cell";
    
    ZQNearFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserIndentifier];
    
    if (!cell) {
        
        cell = [[ZQNearFriendCell alloc] init];
        
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}

@end
