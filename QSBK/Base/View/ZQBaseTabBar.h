//
//  ZQBaseTabBar.h
//  QSBK
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BlockType)(NSInteger);

@interface ZQBaseTabBar : UIView

@property (nonatomic, strong)NSArray *items;

@property (nonatomic, copy)BlockType selectedIndex;

- (void)setSelectedIndex:(BlockType)selectedIndex;

@end


@interface ZQButton : UIButton

@end