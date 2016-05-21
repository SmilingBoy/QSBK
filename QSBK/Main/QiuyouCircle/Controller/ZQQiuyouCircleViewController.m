//
//  ZQQiuyouCircleViewController.m
//  QSBK
//
//  Created by lx on 16/5/14.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQQiuyouCircleViewController.h"
#import "ZQQiuyouCollectionViewCell.h"
#import "ZQSegmentView.h"


#define kTabBarHeight self.tabBarController.tabBar.height
#define kNavBarBottom self.navigationController.navigationBar.bottom

@interface ZQQiuyouCircleViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, weak)ZQSegmentView *headView;
@property (nonatomic, weak)UICollectionView *collection;

@end

@implementation ZQQiuyouCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpNavBarButton];

    [self setUpHeadView];

    [self setUpCollectionView];
    
}

/**
 *  设置右侧导航栏按钮
 */
- (void)setUpNavBarButton{
    
    UIImage *image1 = [UIImage imageNamed:@"group_create"];
    image1 = [[image1 scaleImageWithSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightBarButton1 = [[UIBarButtonItem alloc]initWithImage:image1 style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButttonClick_1:)];
    
    
    UIImage *image2 = [UIImage imageNamed:@"qiuyou_circle_foot"];
    image2 = [[image2 scaleImageWithSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 80, 30);
    
    [button setTitle:@"签到" forState:UIControlStateNormal];
    [button setImage:image2 forState:UIControlStateNormal];
    button.imageView.contentMode = UIViewContentModeRight;
    
    UIBarButtonItem *rightBarButton2 = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItems = @[rightBarButton1,rightBarButton2];
    
}

- (void)rightBarButttonClick_1:(UIButton *)sender{
    
}

- (void)rightBarButttonClick_2:(UIButton *)sender{
}

/**
 *  添加头视图
 */
- (void)setUpHeadView{
    
    ZQSegmentView *headView = [[ZQSegmentView alloc]initWithFrame:CGRectMake(0, kNavBarBottom, kScreenWidth, 50)];
    NSArray *titleArray = @[@"隔壁",@"已粉",@"视频",@"话题"];
    [headView setTitleArray:titleArray];
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
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - kNavBarBottom - kTabBarHeight );
    
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kNavBarBottom, kScreenWidth, kScreenHeight - kNavBarBottom - kTabBarHeight) collectionViewLayout:layout];
    
    _collection = collection;
    [self.view insertSubview:_collection belowSubview:_headView];
    
    collection.delegate = self;
    collection.dataSource = self;
    
    
    //开启分页,关闭反弹效果,隐藏滚动条
    collection.pagingEnabled = YES;
    collection.bounces = NO;
    collection.showsHorizontalScrollIndicator = NO;
    
    collection.backgroundColor = [UIColor clearColor];
    
    //注册cell
    [collection registerClass:[ZQQiuyouCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}
#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZQQiuyouCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell setSliderOffset:^(BOOL isUp) {
        
        [UIView animateWithDuration:0.1 animations:^{
            
            if (isUp) {
                
                self.headView.top = 20;
                
            }
            if (!isUp) {
                self.headView.top = 64;
            }
            
        }];
        
    }];
    
    return cell;
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    CGFloat offsetX = targetContentOffset -> x;
    NSInteger index = offsetX /kScreenWidth;
    
    [_headView setSelectIndex:index];
    
    [UIView animateWithDuration:0.1 animations:^{
        
        self.headView.top = 64;
        
    }];
    
}


@end
