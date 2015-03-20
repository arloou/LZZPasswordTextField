//
//  LZZSecuLabel.m
//  UITextFieldDemo
//
//  Created by ucs on 15/3/20.
//  Copyright (c) 2015年 陆子铮. All rights reserved.
//

#import "LZZSecuLabel.h"

@interface LZZSecuLabel()


@end

@implementation LZZSecuLabel

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        //
        _originalText=@"";
    }
    return self;
}

-(void)setSecuText:(NSString *)text{
    self.text=text;
    self.originalText=text;
    [self performSelector:@selector(changeToSecuText) withObject:nil afterDelay:0.5];
}

-(void)changeToSecuText{
    if (self.text.length>0) {
        self.text=@"●";
    }
}

@end
