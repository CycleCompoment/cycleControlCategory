//
//  UITextView+CycleCreat.m
//  cycleCategoryTool
//
//  Created by ddy on 2018/7/2.
//

#import "UITextView+CycleCreat.h"

@implementation UITextView (CycleCreat)
///1.1 创建textView
+ (__kindof UITextView *)cycle_creatTViewFrame:(CGRect)frame textView:(Class)textViewClass text:(NSString *)text tColor:(UIColor *)textColor tFontSize:(CGFloat)fontSize tAlignMent:(NSTextAlignment)alignMent{
    //1.创建，如果传入的textViewClass是自定义的TextView，就按照自定义初始化方法走，否则就是系统初始化方法
    UITextView *txtView = nil;
    if (textViewClass) {
        txtView = [[textViewClass alloc]initWithFrame:frame];
    } else {
        txtView = [[UITextView alloc]initWithFrame:frame];
    }
    //2.设置文字
    txtView.text              = text;
    //3.设置文字颜色
    txtView.textColor         = textColor;
    //4.设置文字大小
    txtView.font              = [UIFont systemFontOfSize:fontSize];
    //5.设置对齐方式
    txtView.textAlignment     = alignMent;
    return txtView;
}
@end
