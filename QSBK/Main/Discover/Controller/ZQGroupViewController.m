//
//  ZQGroupViewController.m
//  QSBK
//
//  Created by lx on 16/5/19.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQGroupViewController.h"
#import "ZQSegmentView.h"
#import "ZQGroupCell.h"

@interface ZQGroupViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak)UITableView *tableView1;
@property (nonatomic, weak)UITableView *tableView2;
@property (nonatomic, weak)ZQSegmentView *segmentView;

@end

@implementation ZQGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavBarButton];
    
    [self setUpSegmentView];
    
    [self setUpTableView];
    
    [self swipe];
    
}


- (void)setUpNavBarButton{

    //左侧返回按钮定制
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    leftButton.frame = CGRectMake(0, 0, 50, 50);
    [leftButton setTitle:@"群" forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"abc_ic_ab_back_holo_dark"] forState:UIControlStateNormal];
    
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0);
    leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0);
    
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
}

- (void)leftButtonClick:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)setUpSegmentView{
    
    ZQSegmentView *segmentView = [[ZQSegmentView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.bottom, kScreenWidth, 50)];
    
    segmentView.titleArray = @[@"附近的群",@"群天梯"];
    
    [segmentView setSelectIndexChange:^(NSInteger index){
        
        [self scrollTableView:index];
        
    }];
    
    _segmentView = segmentView;
    
    [self.view addSubview:_segmentView];
    
}

- (void)setUpTableView{
    
    UITableView *tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.bottom + 50, kScreenWidth, kScreenHeight)];
    
    tableView1.delegate = self;
    tableView1.dataSource = self;
    
    _tableView1 = tableView1;
    [self.view addSubview:_tableView1];
    
    UITableView *tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth, self.navigationController.navigationBar.bottom + 50, kScreenWidth, kScreenHeight)];
    
    tableView2.dataSource = self;
    tableView2.delegate = self;
    
    _tableView2 = tableView2;
    [self.view addSubview:_tableView2];
    
    
}

/**
 *  tableView翻页
 *
 *  @param index
 */
- (void)scrollTableView:(NSInteger)index{
    
    if (index == 0) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            _tableView1.transform = CGAffineTransformIdentity;
            _tableView2.transform = CGAffineTransformIdentity;
            
        }];
        
    }
    
    if (index == 1) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            _tableView1.transform = CGAffineTransformMakeTranslation(-kScreenWidth, 0);
            _tableView2.transform = CGAffineTransformMakeTranslation(-kScreenWidth, 0);
            
        }];
        
    }

}

/**
 *  添加手势识别
 */
- (void)swipe{
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDirection:)];
    
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [_tableView1 addGestureRecognizer:leftSwipe];
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDirection:)];
    
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [_tableView2 addGestureRecognizer:rightSwipe];
    
}

- (void)swipeDirection:(UISwipeGestureRecognizer *)swipe{
    
    switch (swipe.direction) {
        case UISwipeGestureRecognizerDirectionRight:
            
            
            [_segmentView setSelectIndex:0];
            [self scrollTableView:0];
            
            
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            
            
            [_segmentView setSelectIndex:1];
            [self scrollTableView:1];
            
            
            break;
        default:
            break;
    }
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuerIndentiFier = @"cell";
    
    ZQGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:reuerIndentiFier];
    
    if (!cell) {
        
        cell = [[ZQGroupCell alloc] init];
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}

@end
