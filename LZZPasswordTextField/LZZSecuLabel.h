//
//  LZZSecuLabel.h
//  UITextFieldDemo
//
//  Created by LZZ on 15/3/20.
//  Copyright (c) 2015年 陆子铮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZZSecuLabel : UILabel

@property(nonatomic,copy)NSString * originalText;

-(instancetype)initWithFrame:(CGRect)frame;

-(void)setSecuText:(NSString *)text;

-(void)changeToSecuText;

@end
