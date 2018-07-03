//
//  UITextField+CycleCreat.h
//  cycleCategoryTool
//
//  Created by ddy on 2018/7/2.
//  创建textField

#import <UIKit/UIKit.h>

@interface UITextField (CycleCreat)

/** 修改占位文字颜色  */
@property (nonatomic, strong) UIColor *placeholderColor;


/**
 *  1.创建textField
 * @param frame : 尺寸
 * @param fieldClass   : fieldClass有值 则初始化以传的fieldClass创建,否则默认UITextField创建
 * @param text : 标题
 * @param textColor : 标题颜色
 * @param fontSize : 标题字体大小
 * @param placeHolder : 占位文字
 * @param alignMent : 文字对齐方式
 */
+ (__kindof UITextField *)cycle_CreatTFieldFrame:(CGRect)frame textField:(Class)fieldClass text:(NSString *)text tColor:(UIColor *)textColor fSize:(CGFloat)fontSize pHolder:(NSString *)placeHolder tAligment:(NSTextAlignment)alignMent;
@end
