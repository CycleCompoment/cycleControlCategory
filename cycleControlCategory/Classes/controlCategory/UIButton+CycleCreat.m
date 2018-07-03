//
//  UIButton+CycleCreat.m
//  sdas
//
//  Created by ddy on 2018/6/29.
//  Copyright © 2018年 ddy. All rights reserved.
//

#import "UIButton+CycleCreat.h"
#import <objc/runtime.h>
static NSString *keyOfMethod;
static NSString *keyOfObjectBlock;
/* runtime
 objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
 id object                     : 表示关联者，是一个对象，变量名理所当然也是object
 const void *key               : 获取被关联者的索引key
 id value                      : 被关联者，这里是一个block
 objc_AssociationPolicy policy : 关联时采用的协议，有assign，retain，copy等协议，一般使用OBJC_ASSOCIATION_RETAIN_NONATOMIC
 */
@implementation UIButton (CycleCreat)
/**
 * 1.创建按钮(只含有文字)
 */
+ (__kindof UIButton *)cycle_creatBFrame:(CGRect)frame Btn:(Class)btnClass BTitle:(NSString *)title BColor:(UIColor *)titleColor BFont:(CGFloat)titleFontSize BClick:(ButtonActionBlock)block{
    //1.创建
    UIButton *button = nil;
    if (btnClass) {
        button = [btnClass buttonWithType:UIButtonTypeCustom];
    } else {
        button = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    button.frame = frame;
    //2.设置标题
    [button setTitle:title forState:UIControlStateNormal];
    //3.设置标题颜色
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    //4.设置字体
    button.titleLabel.font = [UIFont systemFontOfSize:titleFontSize];
    ///5.点击事件
    [button addTarget:button action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    ///6.写上此句再点击按钮keyOfMethod这个指针会响应点击
    objc_setAssociatedObject(button, &keyOfMethod, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return button;
}
/**
 * 2.创建按钮(只含有图片)
 */
+ (__kindof UIButton *)cycle_creatBFrame:(CGRect)frame Btn:(Class)btnClass BNorImg:(UIImage *)normalImage BHigImg:(UIImage *)heightLightedImage BClick:(ButtonActionBlock)block{
    //1.创建
    UIButton *button = nil;
    if (btnClass) {
        button = [btnClass buttonWithType:UIButtonTypeCustom];
    } else {
        button = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    button.frame = frame;
    //2.1 设置普通状态下的图片
    [button setImage:normalImage forState:UIControlStateNormal];
    //2.2 设置高亮状态下的图片
    [button setImage:heightLightedImage forState:UIControlStateHighlighted];
    ///3.点击事件
    [button addTarget:button action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    ///4.写上此句再点击按钮keyOfMethod这个指针会响应点击
    objc_setAssociatedObject(button, &keyOfMethod, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return button;
}
/**
 * 3.创建按钮(图片+文字)
 */
+ (__kindof UIButton *)cycle_creatBFrame:(CGRect)frame Btn:(Class)btnClass BTitle:(NSString *)title BColor:(UIColor *)titleColor BFont:(CGFloat)titleFontSize BNorImg:(UIImage *)normalImage BHigImg:(UIImage *)heightLightedImage BClick:(ButtonActionBlock)block{
    //1.创建
    UIButton *button = nil;
    if (btnClass) {
        button = [btnClass buttonWithType:UIButtonTypeCustom];
    } else {
        button = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    button.frame = frame;
    //2.1 设置标题
    [button setTitle:title forState:UIControlStateNormal];
    //2.2 设置标题颜色
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    //2.3 设置字体
    button.titleLabel.font = [UIFont systemFontOfSize:titleFontSize];
    //3.1 设置普通状态下的图片
    [button setImage:normalImage forState:UIControlStateNormal];
    //3.2 设置高亮状态下的图片
    [button setImage:heightLightedImage forState:UIControlStateHighlighted];
    //4.点击事件
    [button addTarget:button action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    //5.写上此句再点击按钮keyOfMethod这个指针会响应点击
    objc_setAssociatedObject(button, &keyOfMethod, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return button;
}









//按钮点击
- (void)buttonClick:(UIButton *)button{
    ///如果您使用类(Class)方法直接调用
    ButtonActionBlock ClassBlock = (ButtonActionBlock)objc_getAssociatedObject(button, &keyOfMethod);
    if (ClassBlock) {
        ClassBlock(button);
    }
    ///如果您使用对象方法(Object)调用
    ButtonActionBlock Objectblock = (ButtonActionBlock)objc_getAssociatedObject(button, &keyOfObjectBlock);
    if (Objectblock) {
        Objectblock(button);
    }
}



///触发关联对象方法
-(void)setActionBlock:(ButtonActionBlock)actionBlock{
    objc_setAssociatedObject(self, &keyOfObjectBlock, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(ButtonActionBlock)actionBlock{
    return objc_getAssociatedObject(self, &keyOfObjectBlock);
}














@end
