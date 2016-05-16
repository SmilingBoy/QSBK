//
//  ZQBaseTabBar.m
//  QSBK
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQBaseTabBar.h"
#import "UIViewExt.h"

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
        
        ZQButton *button = [[ZQButton alloc]initWithFrame:CGRectMake(i * kButtonWidth, 0, kButtonWidth, kTabBarHeight)];
        
        button.tag = 1000 + i;
        [button setTitle:item.title forState:UIControlStateNormal];
        [button setImage:item.image forState:UIControlStateNormal];
        [button setImage:item.selectedImage forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.imageView.contentMode = UIViewContentModeCenter;
        
        [self addSubview:button];
        
        if (i == 0) {
            button.selected = YES;
            _selectedButton = button;
        }

    }
    
}

- (void)buttonClick:(UIButton *)sender{
    
    if (sender ==  _selectedButton) {
        return;
    }
    
    sender.selected = YES;
    
    _selectedButton.selected = NO;
    _selectedButton = sender;
    self.selectedIndex(sender.tag - 1000);
}

@end

#pragma mark 自定义Button
@interface ZQButton ()

@property (nonatomic, weak)UIImageView *subImageView;
@property (nonatomic, weak)UILabel *subLable;
@property (nonatomic, strong)UIImage *normalImage;
@property (nonatomic, strong)UIImage *selectImage;


@end

@implementation ZQButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *subImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.height * 0.7, self.height * 0.7)];
        subImageView.centerX = self.width/2.0;
        _subImageView = subImageView;
        [self addSubview:_subImageView];
        
        UILabel *subLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, subImageView.height, self.width, self.height * 0.3)];
        subLabel.textAlignment = NSTextAlignmentCenter;
        subLabel.textColor = [UIColor lightGrayColor];
        subLabel.font = [UIFont boldSystemFontOfSize:12];
        _subLable = subLabel;
        [self addSubview:_subLable];
    }
    return self;
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    
    _subLable.text = title;
    
}

-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    
    if (state == UIControlStateNormal) {
        //保存默认图片
        _normalImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [_subImageView setImage:_normalImage];
        
    }else if (state == UIControlStateSelected){
        //保存选中图片
        _selectImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
}

-(void)setSelected:(BOOL)selected{
    
    [super setSelected:selected];
    
    if (self.selected == YES) {
  
        _subImageView.image = _selectImage;
        _subLable.textColor = [UIColor colorWithRed:246/255.0 green:172/255.0 blue:0 alpha:1];
        
    }else{
        
        _subImageView.image = _normalImage;
        
        _subLable.textColor = [UIColor lightGrayColor];
    }
    
}

@end







