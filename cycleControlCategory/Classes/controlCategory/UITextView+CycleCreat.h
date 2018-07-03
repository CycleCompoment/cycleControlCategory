//
//  UITextView+CycleCreat.h
//  cycleCategoryTool
//
//  Created by ddy on 2018/7/2.
//  创建UITextView

#import <UIKit/UIKit.h>

@interface UITextView (CycleCreat)

/**
 *  1.创建textView
 * @param frame : 尺寸
 * @param textViewClass   : textViewClass有值 则初始化以传的textViewClass创建,否则默认UITextView创建
 * @param text : 标题
 * @param textColor : 标题颜色
 * @param fontSize : 标题字体大小
 * @param alignMent : 文字对齐方式
 */
+ (__kindof UITextView *)cycle_creatTViewFrame:(CGRect)frame textView:(Class)textViewClass text:(NSString *)text tColor:(UIColor *)textColor tFontSize:(CGFloat)fontSize tAlignMent:(NSTextAlignment)alignMent;
@end
