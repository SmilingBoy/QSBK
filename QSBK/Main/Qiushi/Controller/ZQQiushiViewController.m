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

//    [self setUpRightBarButtons];
    
}

- (void)setUpRightBarButtons{
    
    UIImage *image = [UIImage imageNamed:@"ic_add_article"];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width/2.0, image.size.height/2.0), NO, 0);
    [image drawInRect:CGRectMake(0, 0, image.size.width/2.0, image.size.height/2.0)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIBarButtonItem *rightBarButton1 = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightBarButton1;
    
}


@end
