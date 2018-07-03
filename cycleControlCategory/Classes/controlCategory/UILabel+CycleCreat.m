//
//  UILabel+CycleCreat.m
//  cycleCategoryTool
//
//  Created by ddy on 2018/7/2.
//

#import "UILabel+CycleCreat.h"
#import <objc/runtime.h>

static NSString *keyOfMethod;
static NSString *keyOfObjectBlock;

@implementation UILabel (CycleCreat)
/* runtime
 objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
 id object                     : 表示关联者，是一个对象，变量名理所当然也是object
 const void *key               : 获取被关联者的索引key
 id value                      : 被关联者，这里是一个block
 objc_AssociationPolicy policy : 关联时采用的协议，有assign，retain，copy等协议，一般使用OBJC_ASSOCIATION_RETAIN_NONATOMIC
 */

/**
 * 1.创建Label
 */
+ (__kindof UILabel *)cycle_creatWFrame:(CGRect)frame Label:(Class)lableClass text:(NSString *)text tColor:(UIColor *)textColor tFont:(CGFloat)fontSize labelClick:(labelActionBlock)block{
    //1.创建，如果传入的lableClass是自定义的label，就按照自定义初始化方法走，否则就是系统初始化方法
    UILabel *label = nil;
    if (lableClass) {
        label = [lableClass new];
    } else {
        label = [UILabel new];
    }
    label.frame = frame;
    //2.设置字体颜色
    label.textColor  = textColor;
    //3.1 设置字体大小
    label.font = [UIFont systemFontOfSize:fontSize];
    //3.2 设置文字
    label.text = text;
    //4.点击label
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:label action:@selector(LabelClick:)]];
    ///6.写上此句再点击按钮keyOfMethod这个指针会响应点击
    objc_setAssociatedObject(label, &keyOfMethod, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return label;
}
#pragma mark --- 点击label
- (void)LabelClick:(UITapGestureRecognizer *)tap{
    UILabel *label = (UILabel *)tap.view;
    ///如果您使用类(Class)方法直接调用
    labelActionBlock ClassBlock = (labelActionBlock)objc_getAssociatedObject(label, &keyOfMethod);
    if (ClassBlock) {
        ClassBlock(label);
    }
    ///如果您使用对象方法(Object)调用
    labelActionBlock ObjectBlock = (labelActionBlock)objc_getAssociatedObject(label, &keyOfObjectBlock);
    if (ObjectBlock) {
        ObjectBlock(label);
    }
}
///触发关联对象方法
- (void)setActionBlock:(labelActionBlock)actionBlock{
    objc_setAssociatedObject(self, &keyOfObjectBlock, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (labelActionBlock)actionBlock{
    return objc_getAssociatedObject(self, &keyOfObjectBlock);
}







@end
