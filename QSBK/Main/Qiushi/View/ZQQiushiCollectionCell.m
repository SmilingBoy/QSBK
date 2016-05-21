//
//  ZQQiushiCollectionCell.m
//  QSBK
//
//  Created by lx on 16/5/17.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQQiushiCollectionCell.h"
#import "ZQQiushiTableViewCell.h"

@interface ZQQiushiCollectionCell () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak)UITableView *tableView;

@property (nonatomic, assign)CGFloat oldOffset;

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
    
    static NSString *reuserIdentifier = @"cell";
    
    ZQQiushiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserIdentifier];
    
    if (!cell) {
        
        cell = [[ZQQiushiTableViewCell alloc] init];
        
    }
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 300;
    
}

@end
