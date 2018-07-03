//
//  UICollectionView+CycleCreat.m
//  cycleCategoryTool
//
//  Created by ddy on 2018/7/2.
//

#import "UICollectionView+CycleCreat.h"

@implementation UICollectionView (CycleCreat)
/**
 * 1 初始化UICollectionView(流水布局)
 */
+ (__kindof  UICollectionView *)cycle_creatCollectionViewFrame:(CGRect)frame  collectionView:(Class)collectionViewClass layout:(UICollectionViewFlowLayout *)layout delegate:(id <UICollectionViewDelegate>)delegate datasource:(id<UICollectionViewDataSource>)datasource{
    //1.创建，如果传入的collectionViewClass是自定义的collectionView，就按照自定义初始化方法走，否则就是系统初始化方法
    UICollectionView *collectionView = nil;
    if (collectionViewClass) {
        collectionView = [[collectionViewClass alloc]initWithFrame:frame collectionViewLayout:layout];
    } else {
        collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    }
    //2.设置代理
    collectionView.delegate            = delegate;
    //3.设置数据源
    collectionView.dataSource          = datasource;
    //4.返回collectionView
    return collectionView;
}

/**
 * 2.创建UICollectionView(普通布局)
 */
+ (__kindof  UICollectionView *)cycle_creatCollectionViewFrame:(CGRect)frame  collectionView:(Class)collectionViewClass normallayout:(UICollectionViewLayout *)layout delegate:(id <UICollectionViewDelegate>)delegate datasource:(id<UICollectionViewDataSource>)datasource{
    //1.创建，如果传入的collectionViewClass是自定义的collectionView，就按照自定义初始化方法走，否则就是系统初始化方法
    UICollectionView *collectionView = nil;
    if (collectionViewClass) {
        collectionView = [[collectionViewClass alloc]initWithFrame:frame collectionViewLayout:layout];
    } else {
        collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    }
    //2.设置代理
    collectionView.delegate            = delegate;
    //3.设置数据源
    collectionView.dataSource          = datasource;
    //4.返回collectionView
    return collectionView;
}

@end
