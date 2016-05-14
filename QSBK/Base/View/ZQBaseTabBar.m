//
//  ZQBaseTabBar.m
//  QSBK
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQBaseTabBar.h"

#define kTabBarHeight self.frame.size.height
#define kButtonWidth self.frame.size.width/self.items.count

@interface ZQBaseTabBar ()

@property (nonatomic, strong)UIButton *selectedButton;

@end

@implementation ZQBaseTabBar

- (void)setItems:(NSArray *)items{
    
    _items = items;
    
    for (int i = 0; i < items.count; i++) {
        
        UITabBarItem *item = items[i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * kButtonWidth, 0, kButtonWidth, kTabBarHeight);
        button.tag = 1000 + i;
        [button setTitle:item.title forState:UIControlStateNormal];
        [button setImage:item.image forState:UIControlStateNormal];
        [button setImage:item.selectedImage forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        if (i == 0) {
            _selectedButton = button;
            _selectedButton.selected = YES;
        }
    }
    
}

- (void)buttonClick:(UIButton *)sender{
    
    sender.selected = YES;
    
    _selectedButton.selected = NO;
    _selectedButton = sender;
    self.selectedIndex(sender.tag - 1000);
}



















@end
