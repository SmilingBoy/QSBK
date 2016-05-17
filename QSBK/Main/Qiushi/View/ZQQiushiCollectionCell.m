//
//  ZQQiushiCollectionCell.m
//  QSBK
//
//  Created by lx on 16/5/17.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQQiushiCollectionCell.h"

@interface ZQQiushiCollectionCell ()

@property (nonatomic, weak)UITableView *tableView;


@end

@implementation ZQQiushiCollectionCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpTableView];
  
    }
    return self;
}

#pragma mark --TODO
- (void)setUpTableView{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    _tableView = tableView;
    [self.contentView addSubview:_tableView];
    
    tableView.backgroundColor = [UIColor whiteColor];
    
}


@end
