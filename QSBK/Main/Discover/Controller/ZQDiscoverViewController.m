//
//  ZQDiscoverViewController.m
//  QSBK
//
//  Created by lx on 16/5/19.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQDiscoverViewController.h"

@interface ZQDiscoverViewController ()

@end

@implementation ZQDiscoverViewController

- (instancetype)init
{
    
    UIStoryboard *str = [UIStoryboard storyboardWithName:@"ZQDiscoverViewController" bundle:nil];
    
    return [str instantiateInitialViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
