//
//  ZQQiushiViewController.m
//  QSBK
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQQiushiViewController.h"

@interface ZQQiushiViewController ()

@end

@implementation ZQQiushiViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpRightBarButtons]; 
    
    [self setUpTableView];
}

/**
 *  设置右侧按钮
 */
- (void)setUpRightBarButtons{
    
    UIImage *image1 = [UIImage imageNamed:@"ic_add_article"];
    image1 = [[image1 scaleImageWithSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightBarButton1 = [[UIBarButtonItem alloc]initWithImage:image1 style:UIBarButtonItemStyleDone target:self action:nil];
    
    UIImage *image2 = [UIImage imageNamed:@"ic_audit"];
    image2 = [[image2 scaleImageWithSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightBarButton2 = [[UIBarButtonItem alloc]initWithImage:image2 style:UIBarButtonItemStyleDone target:self action:nil];
    
    self.navigationItem.rightBarButtonItems = @[rightBarButton1,rightBarButton2];
    
}

/**
 *  添加tableView
 */
- (void)setUpTableView{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:kScreenBounds style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    
}


@end
