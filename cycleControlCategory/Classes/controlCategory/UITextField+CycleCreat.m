//
//  UITextField+CycleCreat.m
//  cycleCategoryTool
//
//  Created by ddy on 2018/7/2.
//

#import "UITextField+CycleCreat.h"
static NSString *const kGetPlaceHolderColor = @"_placeholderLabel.textColor";
@implementation UITextField (CycleCreat)

-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    //1.如果先设置占位文字颜色，后写文字就可能会文字不变成自己想要的颜色，加上这句就好了（设置颜色和内容不是按顺序来的）
    NSString *tempPlaceHolder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = tempPlaceHolder;
    //2.（如果传入nil）恢复默认的占位文字颜色
    if(placeholderColor == nil){
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    //3.设置占位文字颜色
    [self setValue:placeholderColor forKeyPath:kGetPlaceHolderColor];
}

-(UIColor *)placeholderColor{
    return [self valueForKeyPath:kGetPlaceHolderColor];
}



#pragma mark --- 创建
/**
 * 1.创建textField
 */
+ (__kindof UITextField *)cycle_CreatTFieldFrame:(CGRect)frame textField:(Class)fieldClass text:(NSString *)text tColor:(UIColor *)textColor fSize:(CGFloat)fontSize pHolder:(NSString *)placeHolder tAligment:(NSTextAlignment)alignMent{
    //1.创建，如果传入的lableClass是自定义的label，就按照自定义初始化方法走，否则就是系统初始化方法
    UITextField *textField = nil;
    if (fieldClass) {
        textField = [[fieldClass alloc]initWithFrame:frame];
    } else {
        textField = [[UITextField alloc]initWithFrame:frame];
    }
    //2.设置内容
    textField.text        = text;
    //3.设置内容颜色
    textField.textColor   = textColor;
    //4.设置字体大小
    textField.font        = [UIFont systemFontOfSize:fontSize];
    //5.设置占位文字
    textField.placeholder = placeHolder;
    //6.设置对齐 方式
    textField.textAlignment = alignMent;
    return textField;
}
@end
