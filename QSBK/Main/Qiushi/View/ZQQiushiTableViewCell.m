//
//  ZQQiushiTableViewCell.m
//  QSBK
//
//  Created by lx on 16/5/21.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQQiushiTableViewCell.h"

@implementation ZQQiushiTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"ZQQiushiTableViewCell" owner:nil options:nil] lastObject];
    }
    return self;
}

- (void)awakeFromNib {
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
