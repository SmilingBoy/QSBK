//
//  ZQQiushiCollectionCell.h
//  QSBK
//
//  Created by lx on 16/5/17.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SliderBlock)(BOOL);

@interface ZQQiushiCollectionCell : UICollectionViewCell

//tabbleView滑动偏移量
@property (nonatomic, copy)SliderBlock sliderOffset;

- (void)setSliderOffset:(SliderBlock)sliderOffset;

@end
