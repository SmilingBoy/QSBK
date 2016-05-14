//
//  ZQBaseTabBarController.m
//  QSBK
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQBaseTabBarController.h"
#import "ZQQiushiViewController.h"
#import "ZQQiuyouCircleViewController.h"
#import "ZQDIscoverViewController.h"
#import "ZQMessageViewController.h"
#import "ZQMeViewController.h"
#import "ZQBaseNavigationController.h"
#import "ZQBaseTabBar.h"

@interface ZQBaseTabBarController ()

@property (nonatomic, strong)NSMutableArray *items;

@end

@implementation ZQBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addAllChildViews];
    [self setUpTabBar];
    
}

- (NSMutableArray *)items{
    
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

/**
 *  自定义tabbar
 */
- (void)setUpTabBar{
    
    ZQBaseTabBar *tabbar = [[ZQBaseTabBar alloc]initWithFrame:self.tabBar.bounds];
    tabbar.items = _items;
    
    [tabbar setSelectedIndex:^(NSInteger selectedIndex) {
        self.selectedIndex = selectedIndex;
    }];
    [self.tabBar addSubview:tabbar];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //移除原有tabbar
    for (UIView *view in self.tabBar.subviews) {
        if (![view isKindOfClass:[ZQBaseTabBar class]]) {
            [view removeFromSuperview];
        }
    }
}



/**
 *  添加所有标签栏控制器
 */
- (void)addAllChildViews{
    
    ZQQiushiViewController *qiushi = [[ZQQiushiViewController alloc]init];
    [self addOneViewController:qiushi
                  withNorImage:[UIImage imageNamed:@"ic_qiushi_normal"]
                    withSelImg:[UIImage imageNamed:@"ic_qiushi_select"]
                     withTitle:@"糗事"];
    
    ZQQiuyouCircleViewController *qiuyouCircle = [[ZQQiuyouCircleViewController alloc]init];
    [self addOneViewController:qiuyouCircle
                  withNorImage:[UIImage imageNamed:@"ic_qiuyoucircle_normal"]
                    withSelImg:[UIImage imageNamed:@"ic_qiuyoucircle_select"]
                     withTitle:@"糗友圈"];
    
    ZQDIscoverViewController *discover = [[ZQDIscoverViewController alloc]init];
    [self addOneViewController:discover
                  withNorImage:[UIImage imageNamed:@"ic_nearby_normal"]
                    withSelImg:[UIImage imageNamed:@"ic_nearby_select"]
                     withTitle:@"发现"];
    
    ZQMessageViewController *message = [[ZQMessageViewController alloc]init];
    [self addOneViewController:message
                  withNorImage:[UIImage imageNamed:@"ic_message_normal"]
                    withSelImg:[UIImage imageNamed:@"ic_message_select"]
                     withTitle:@"小纸条"];
    
    ZQMeViewController *me = [[ZQMeViewController alloc]init];
    [self addOneViewController:me
                  withNorImage:[UIImage imageNamed:@"ic_mine_normal"]
                    withSelImg:[UIImage imageNamed:@"ic_mine_select"]
                     withTitle:@"我"];
    
}

/**
 *  添加一个控制器
 */
- (void)addOneViewController:(UIViewController *)vc withNorImage:(UIImage *)norImg withSelImg:(UIImage *)selImg withTitle:(NSString *)title{
    
    vc.title = title;
    vc.tabBarItem.image = [norImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [selImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ZQBaseNavigationController *nvc = [[ZQBaseNavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:nvc];
    
    [self.items addObject:vc.tabBarItem];
    
}

@end
