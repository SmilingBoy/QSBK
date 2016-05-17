//
//  ZQBaseNavigationController.m
//  QSBK
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQBaseNavigationController.h"

@interface ZQBaseNavigationController ()

@end

@implementation ZQBaseNavigationController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    
    UIImage *image = [[UIImage imageNamed:@"evaluate_bg.9"] stretchableImageWithLeftCapWidth:10 topCapHeight:0];
    
    [bar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}




@end
