//
//  ZQQiushiViewController.m
//  QSBK
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQQiushiViewController.h"
#import "ZQQiushiHeadView.h"
#import "ZQQiushiCollectionCell.h"

@interface ZQQiushiViewController () <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, weak)ZQQiushiHeadView *headView;
@property (nonatomic, weak)UICollectionView *collection;


@end

@implementation ZQQiushiViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpHeadView];
    [self setUpCollectionView];
    
}

/**
 *  添加头视图,实现标签栏的效果
 */
- (void)setUpHeadView{
    
    ZQQiushiHeadView *headView = [[ZQQiushiHeadView alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.bottom, kScreenWidth, 50)];
    _headView = headView;
    [self.view addSubview:_headView];
    
    
    [_headView setSelectIndexChange:^(NSInteger selectIndex) {
       
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:selectIndex inSection:0];
        
        //滑动到指定位置
        [self.collection scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
    }];

}

/**
 *  添加集合视图,盛放tableView
 */
- (void)setUpCollectionView{
    
    CGFloat tabBarHeight = self.tabBarController.tabBar.height;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - _headView.bottom - tabBarHeight);
    
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, _headView.bottom, kScreenWidth, kScreenHeight - _headView.bottom - tabBarHeight) collectionViewLayout:layout];
    
    _collection = collection;
    [self.view addSubview:_collection];
    
    collection.delegate = self;
    collection.dataSource = self;
    
    //开启分页,关闭反弹效果,隐藏滚动条
    collection.pagingEnabled = YES;
    collection.bounces = NO;
    collection.showsHorizontalScrollIndicator = NO;
    collection.userInteractionEnabled = YES;
    collection.multipleTouchEnabled = YES;
    
    //注册cell
    [collection registerClass:[ZQQiushiCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    
}
#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZQQiushiCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    CGFloat offsetX = targetContentOffset -> x;
    NSInteger index = offsetX /kScreenWidth;
    
    [_headView setSelectIndex:index];
    
}


@end
