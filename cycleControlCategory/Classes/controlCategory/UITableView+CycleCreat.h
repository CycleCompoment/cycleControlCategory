//
//  UITableView+CycleCreat.h
//  cycleCategoryTool
//
//  Created by ddy on 2018/7/2.
//

#import <UIKit/UIKit.h>

@interface UITableView (CycleCreat)
/**
 * 1.创建tableView
 * @param frame : 尺寸
 * @param tableViewClass : tableViewClass有值 则初始化以传的tableViewClass创建,否则默认UITableView创建
 * @param style : 表格模式(UITableViewStylePlain,UITableViewStyleGrouped)
 * @param delegate : 代理
 * @param datasource : 数据源
 * @param separateStyle : 表格分割线样式
 */
+ (__kindof  UITableView *)cycle_creatTableFrame:(CGRect)frame tableView:(Class)tableViewClass style:(UITableViewStyle)style delegate:(id <UITableViewDelegate>)delegate datasource:(id<UITableViewDataSource>)datasource separateStyle:(UITableViewCellSeparatorStyle)separateStyle;

@end
