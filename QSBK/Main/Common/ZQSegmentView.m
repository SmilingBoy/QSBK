//
//  ZQSegmentView.m
//  QSBK
//
//  Created by lx on 16/5/18.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQSegmentView.h"

#define kButtonWidth kScreenWidth/self.titleArray.count
#define kViewHeight self.frame.size.height

@interface ZQSegmentView ()

//当前选中的按钮
@property (nonatomic, weak)UIButton *selectButton;

//按钮下端滑动条视图
@property (nonatomic, weak)UIView *sliderSelectView;

@end

@implementation ZQSegmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        self.layer.borderWidth = 1;
        
    }
    return self;
}

/**
 *  设置标题数组,初始化按钮视图
 *
 *  @param titleArray 标题数组
 */
- (void)setTitleArray:(NSArray *)titleArray{
    
    _titleArray = titleArray;
    
    //添加按钮
    for (int i = 0; i < self.titleArray.count; i++) {
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i * kButtonWidth, 0, kButtonWidth,kViewHeight * 0.9)];
        [self addSubview:button];
        
        button.tag = 1000 + i;
        [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:246/255.0 green:172/255.0 blue:0 alpha:1] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [button addTarget:self action:@selector(setButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            button.selected = YES;
            _selectButton = button;
            _selectIndex = 0;
        }
        
    }
    
    //添加按钮选中状态条
    UIView *sliderSelectView = [[UIView alloc]initWithFrame:CGRectMake(0, kViewHeight * 0.9, kButtonWidth, kViewHeight * 0.1)];
    [self addSubview:sliderSelectView];
    _sliderSelectView = sliderSelectView;
    
    sliderSelectView.backgroundColor = [UIColor colorWithRed:246/255.0 green:172/255.0 blue:0 alpha:1];
    
}

- (void)setButtonClick:(UIButton *)sender{
    
    if (sender == _selectButton) {
        return;
    }
    
    _selectIndex = sender.tag - 1000;
    
    _selectIndexChange(_selectIndex);
    
    [self setSelectedState:sender];
    
}

/**
 *  设置选中按钮的下标
 *
 *  @param selectIndex 下标
 */
- (void)setSelectIndex:(NSInteger)selectIndex{
    
    _selectIndex = selectIndex;
    
    [self setSelectedState:[self viewWithTag:(_selectIndex + 1000)]];
    
}

/**
 *  改变按钮状态
 *
 *  @param sender 被改变状态的按钮
 */
- (void)setSelectedState:(UIButton *)sender{
    
    sender.selected = YES;
    
    _selectButton.selected = NO;
    
    _selectButton = sender;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        _sliderSelectView.left = kButtonWidth * _selectIndex;
        
    }];
}


@end
