//
//  ZQQiushiHeadView.h
//  QSBK
//
//  Created by lx on 16/5/17.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BlockType)(NSInteger);

@interface ZQQiushiHeadView : UIView

@property (nonatomic, assign)NSInteger selectIndex;
@property (nonatomic, copy)BlockType selectIndexChange;

- (void)setSelectIndexChange:(BlockType)selectIndexChange;

@end
