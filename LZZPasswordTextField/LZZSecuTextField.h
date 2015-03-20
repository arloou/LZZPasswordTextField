//
//  LZZSecuTextField.h
//  UITextFieldDemo
//
//  Created by LZZ on 15/3/20.
//  Copyright (c) 2015年 陆子铮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZZSecuTextField : UIView

/**
 *  拿密码 get the password you input
 */
@property (nonatomic,readonly)NSString * passWord;
/**
 *  键盘类型 默认为数字  default is numberpad
 */
@property (nonatomic,assign)UIKeyboardType keyBoardType;
/**
 *  背景图片
 */
@property(nonatomic,strong)UIImage * backGroundImage;
/**
 *  文本长度  textfield max length
 */
@property(nonatomic,assign)NSUInteger numbersOfChar;
/**
 *  文字颜色
 */
@property(nonatomic,strong)UIColor * textColor;
/**
 *  字体
 */
@property(nonatomic,strong)UIFont * textFont;


// 三种初始化方法 也可以从通过拖拽storyboard的view创建
// 3 kinds of init methods，still can be use in storyboard
-(instancetype)init;
-(instancetype)initWithFrame:(CGRect)frame;
/**
 *  初始化参数bgImage:背景图 number:文本长度 每一位的size随frame平均分
 */
-(instancetype)initWithFrame:(CGRect)frame andBGImage:(UIImage * )bgImage andNumbersOfChar:(NSUInteger)number andFont:(UIFont * )font andTextColor:(UIColor *)textColor;


/**
 *  弹出键盘
 */
-(void)showKeyBoard;

/**
 *  收回键盘
 */
-(void)hideKeyBoard;

@end
