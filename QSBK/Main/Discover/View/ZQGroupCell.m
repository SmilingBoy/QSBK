//
//  ZQGroupCell.m
//  QSBK
//
//  Created by lx on 16/5/20.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQGroupCell.h"

@interface ZQGroupCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ZQGroupCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"ZQGroupCell" owner:nil options:nil] lastObject];
        
    }
    return self;
}

- (void)awakeFromNib {
    
    _image.layer.cornerRadius = 32;
    _image.clipsToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
