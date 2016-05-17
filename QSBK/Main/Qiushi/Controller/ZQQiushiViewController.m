//
//  ZQQiushiViewController.m
//  QSBK
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQQiushiViewController.h"
#import "ZQQiushiHeadView.h"

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
    
    //添加观察者
    [_headView addObserver:self forKeyPath:@"selectIndex" options:NSKeyValueObservingOptionNew context:nil];

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
    
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}

/**
 *  观察监听
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"selectIndex"]) {
        
        NSInteger index = [[change objectForKey:@"new"] integerValue];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        
        //滑动到指定位置
        [self.collection scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
    }
    
}

#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return cell;
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    CGFloat offsetX = targetContentOffset -> x;
    NSInteger index = offsetX /kScreenWidth;
    
    [_headView setSelectIndex:index];
    
}

@end
