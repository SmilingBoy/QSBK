//
//  ZQNearFriendCell.m
//  QSBK
//
//  Created by lx on 16/5/21.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQNearFriendCell.h"

@interface ZQNearFriendCell ()

@property (weak, nonatomic) IBOutlet UIImageView *image;


@end

@implementation ZQNearFriendCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"ZQNearFriendCell" owner:nil options:nil] lastObject];
        
    }
    return self;
}

- (void)awakeFromNib {
    
    self.image.layer.cornerRadius = 30;
    self.image.clipsToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
