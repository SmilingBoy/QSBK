//
//  ZQQiuyouCollectionViewCell.m
//  QSBK
//
//  Created by lx on 16/5/19.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQQiuyouCollectionViewCell.h"

@interface ZQQiuyouCollectionViewCell ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak)UITableView *tableView;

@property (nonatomic, assign)CGFloat oldOffset;


@end

@implementation ZQQiuyouCollectionViewCell


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
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.bounces = NO;
    tableView.showsVerticalScrollIndicator = NO;
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    headView.backgroundColor = [UIColor lightGrayColor];
    
    tableView.tableHeaderView = headView;
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    return cell;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y = scrollView.contentOffset.y;
    
    if (y > _oldOffset) {
        self.sliderOffset(YES);
    }
    
    if (y < _oldOffset) {
        self.sliderOffset(NO);
    }
    
    _oldOffset = y;
    
    
}



@end
