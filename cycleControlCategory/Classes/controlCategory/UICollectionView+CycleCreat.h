//
//  UICollectionView+CycleCreat.h
//  cycleCategoryTool
//
//  Created by ddy on 2018/7/2.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (CycleCreat)
/**
 * 1.创建UICollectionView(流水布局)
 * @param frame : 尺寸
 * @param collectionViewClass   : collectionViewClass有值 则初始化以传的collectionViewClass创建,否则默认UICollectionView创建
 * @param layout : 流水布局
 * @param delegate : 代理
 * @param datasource : 数据源
 */
+ (__kindof  UICollectionView *)cycle_creatCollectionViewFrame:(CGRect)frame  collectionView:(Class)collectionViewClass layout:(UICollectionViewFlowLayout *)layout delegate:(id <UICollectionViewDelegate>)delegate datasource:(id<UICollectionViewDataSource>)datasource;
/**
 * 2.创建UICollectionView(普通布局)
 * @param frame : 尺寸
 * @param collectionViewClass   : collectionViewClass有值 则初始化以传的collectionViewClass创建,否则默认UICollectionView创建
 * @param layout : 流水布局
 * @param delegate : 代理
 * @param datasource : 数据源
 */
+ (__kindof  UICollectionView *)cycle_creatCollectionViewFrame:(CGRect)frame  collectionView:(Class)collectionViewClass normallayout:(UICollectionViewLayout *)layout delegate:(id <UICollectionViewDelegate>)delegate datasource:(id<UICollectionViewDataSource>)datasource;
@end
