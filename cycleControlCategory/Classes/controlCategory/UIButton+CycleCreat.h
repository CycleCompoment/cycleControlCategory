//
//  UIButton+CycleCreat.h
//  sdas
//
//  Created by ddy on 2018/6/29.
//  Copyright © 2018年 ddy. All rights reserved.
//  快速创建按钮

#import <UIKit/UIKit.h>

typedef void(^ButtonActionBlock)(__kindof UIButton *button);

@interface UIButton (CycleCreat)

/** 按钮回调的block */
@property (nonatomic, copy) ButtonActionBlock actionBlock;

/**
 * 1.创建按钮(只含有文字)
 * @param frame : 尺寸
 * @param title : 标题
 * @param btnClass   : btnClass有值 则初始化以传的btnClass创建,否则默认UIButton创建
 * @param titleColor : 标题颜色
 * @param titleFontSize : 标题字体大小
 * @param block : 按钮点击事件
 */
+ (__kindof UIButton *)cycle_creatBFrame:(CGRect)frame Btn:(Class)btnClass BTitle:(NSString *)title BColor:(UIColor *)titleColor BFont:(CGFloat)titleFontSize BClick:(ButtonActionBlock)block;
/**
 * 2.创建按钮(只含有图片)
 * @param frame : 尺寸
 * @param normalImage : 普通状态下的图片
 * @param btnClass   : btnClass有值 则初始化以传的btnClass创建,否则默认UIButton创建
 * @param heightLightedImage : 高亮状态下的图片
 * @param block : 按钮点击事件
 */
+ (__kindof UIButton *)cycle_creatBFrame:(CGRect)frame Btn:(Class)btnClass BNorImg:(UIImage *)normalImage BHigImg:(UIImage *)heightLightedImage BClick:(ButtonActionBlock)block;
/**
 * 3.创建按钮(图片+文字)
 * @param frame : 尺寸
 * @param btnClass   : btnClass有值 则初始化以传的btnClass创建,否则默认UIButton创建
 * @param normalImage : 普通状态下的图片
 * @param heightLightedImage : 高亮状态下的图片
 * @param title : 标题
 * @param titleColor : 标题颜色
 * @param titleFontSize : 标题字体大小
 * @param block : 按钮点击事件
 */
+ (__kindof UIButton *)cycle_creatBFrame:(CGRect)frame Btn:(Class)btnClass BTitle:(NSString *)title BColor:(UIColor *)titleColor BFont:(CGFloat)titleFontSize BNorImg:(UIImage *)normalImage BHigImg:(UIImage *)heightLightedImage BClick:(ButtonActionBlock)block;




@end
