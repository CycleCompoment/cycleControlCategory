//
//  UILabel+CycleCreat.h
//  cycleCategoryTool
//
//  Created by ddy on 2018/7/2.
//  快速创建Label

#import <UIKit/UIKit.h>

typedef void(^labelActionBlock)(__kindof UILabel *label);

@interface UILabel (CycleCreat)

/** 点击label */
@property (nonatomic, copy) labelActionBlock actionBlock;

/**
 * 1.创建label
 * @param frame : 尺寸
 * @param lableClass   : lableClass有值 则初始化以传的lableClass创建,否则默认UILabel创建
 * @param text : 标题
 * @param textColor : 标题颜色
 * @param fontSize : 标题字体大小
 * @param block : 按钮点击事件
 */
+ (__kindof UILabel *)cycle_creatWFrame:(CGRect)frame Label:(Class)lableClass text:(NSString *)text tColor:(UIColor *)textColor tFont:(CGFloat)fontSize labelClick:(labelActionBlock)block;
@end
