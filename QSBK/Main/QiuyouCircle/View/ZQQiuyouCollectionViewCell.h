//
//  ZQQiuyouCollectionViewCell.h
//  QSBK
//
//  Created by lx on 16/5/19.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^SliderBlock)(BOOL);

@interface ZQQiuyouCollectionViewCell : UICollectionViewCell

//tabbleView滑动偏移量
@property (nonatomic, copy)SliderBlock sliderOffset;

- (void)setSliderOffset:(SliderBlock)sliderOffset;



@end
