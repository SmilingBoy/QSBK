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
    
    //自定义navigationItem左侧按钮样式
    UIView *leftButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    
    UIImageView *leftButtonImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_ab_qiushi"]];
    leftButtonImage.frame = CGRectMake(0, 0, 40, 40);
    [leftButtonView addSubview:leftButtonImage];
    
    UILabel *leftButtonLebel = [[UILabel alloc]initWithFrame:CGRectMake(leftButtonImage.width, 0, 40, 40)];
    leftButtonLebel.text = title;
    leftButtonLebel.textColor = [UIColor whiteColor];
    leftButtonLebel.font = [UIFont boldSystemFontOfSize:20];
    [leftButtonLebel sizeToFit];
    leftButtonLebel.centerY = leftButtonImage.centerY;
    [leftButtonView addSubview:leftButtonLebel];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:leftButtonView];
    
    //设置子视图
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [norImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [selImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.navigationItem.leftBarButtonItem = leftButton;
    
    //设置NavigationController
    ZQBaseNavigationController *nvc = [[ZQBaseNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nvc];
    
    [self.items addObject:vc.tabBarItem];
    
    //设置导航栏右侧按钮
    UIImage *image1 = [UIImage imageNamed:@"ic_add_article"];
    image1 = [[image1 scaleImageWithSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightBarButton1 = [[UIBarButtonItem alloc]initWithImage:image1 style:UIBarButtonItemStyleDone target:self action:nil];
    
    UIImage *image2 = [UIImage imageNamed:@"ic_audit"];
    image2 = [[image2 scaleImageWithSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightBarButton2 = [[UIBarButtonItem alloc]initWithImage:image2 style:UIBarButtonItemStyleDone target:self action:nil];
    
    vc.navigationItem.rightBarButtonItems = @[rightBarButton1,rightBarButton2];
    
}


@end
