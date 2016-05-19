//
//  ZQSegmentView.h
//  QSBK
//
//  Created by lx on 16/5/18.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BlockType)(NSInteger);

@interface ZQSegmentView : UIView

//选中按钮坐标
@property (nonatomic, assign)NSInteger selectIndex;

//下标更改block
@property (nonatomic, copy)BlockType selectIndexChange;

//标题数组
@property (nonatomic, strong)NSArray *titleArray;

- (void)setSelectIndexChange:(BlockType)selectIndexChange;

@end
