//
//  UITableView+CycleCreat.m
//  cycleCategoryTool
//
//  Created by ddy on 2018/7/2.
//

#import "UITableView+CycleCreat.h"

@implementation UITableView (CycleCreat)
/**
 * 1 初始化tableView
 */
+ (__kindof  UITableView *)cycle_creatTableFrame:(CGRect)frame tableView:(Class)tableViewClass style:(UITableViewStyle)style delegate:(id <UITableViewDelegate>)delegate datasource:(id<UITableViewDataSource>)datasource separateStyle:(UITableViewCellSeparatorStyle)separateStyle{
    //1.创建，如果传入的tableViewClass是自定义的tableView，就按照自定义初始化方法走，否则就是系统初始化方法
    UITableView *tableView = nil;
    if (tableViewClass) {
        tableView = [[tableViewClass alloc]initWithFrame:frame style:style];
    } else {
        tableView = [[UITableView alloc]initWithFrame:frame style:style];
    }
    //2.设置代理
    tableView.delegate            = delegate;
    //3.设置数据源
    tableView.dataSource          = datasource;
    //4.分割线style
    tableView.separatorStyle      = separateStyle;
    
    return tableView;
}

@end
