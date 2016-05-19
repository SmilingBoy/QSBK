//
//  ZQQiushiHeadView.m
//  QSBK
//
//  Created by lx on 16/5/17.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQQiushiHeadView.h"

#define kButtonWidth kScreenWidth/5.0
#define kViewHeight self.frame.size.height
// 246 172 0 color

@interface ZQQiushiHeadView ()

@property (nonatomic, weak)UIButton *selectButton;
@property (nonatomic, weak)UIView *sliderSelectView;



@end

@implementation ZQQiushiHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        self.layer.borderWidth = 1;
        
        NSArray *titleArray = @[@"专享",@"视频",@"纯文",@"纯图",@"精华"];
        
        //添加按钮
        for (int i = 0; i < titleArray.count; i++) {
            
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i * kButtonWidth, 0, kButtonWidth,kViewHeight * 0.9)];
            [self addSubview:button];
            
            button.tag = 1000 + i;
            [button setTitle:titleArray[i] forState:UIControlStateNormal];
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
    return self;
}

- (void)setButtonClick:(UIButton *)sender{
    
    if (sender == _selectButton) {
        return;
    }
    
    self.selectIndex = sender.tag - 1000;
    
    self.selectIndexChange(self.selectIndex);
    
}

- (void)setSelectIndex:(NSInteger)selectIndex{
    
    _selectIndex = selectIndex;
    
    [self setSelectedState:[self viewWithTag:(_selectIndex + 1000)]];
    
}

- (void)setSelectedState:(UIButton *)sender{
    
    sender.selected = YES;
    
    _selectButton.selected = NO;
    
    _selectButton = sender;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        _sliderSelectView.left = kButtonWidth * _selectIndex;
        
    }];
}

@end
