//
//  LZZSecuTextField.m
//  UITextFieldDemo
//
//  Created by LZZ on 15/3/20.
//  Copyright (c) 2015年 陆子铮. All rights reserved.
//

#import "LZZSecuTextField.h"
#import "LZZSecuLabel.h"

@interface LZZSecuTextField()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField * tf;

@property(nonatomic,strong)NSMutableArray * allLabels;

@property(nonatomic,strong)UIImageView * bgImgView;

@end

@implementation LZZSecuTextField



-(void)awakeFromNib
{
    // BGView
    self.frame=self.frame;
    self.clipsToBounds=YES;
    if (!_bgImgView) {
        _bgImgView=[[UIImageView alloc] initWithFrame:self.frame];
        [self addSubview:_bgImgView];
    }
    if (!_tf)
    {
        _tf=[[UITextField alloc] initWithFrame:CGRectMake(0, -20, 20, 10)];
        _tf.keyboardType=UIKeyboardTypeNumberPad;
        _tf.delegate=self;
        [self addSubview:_tf];
    }
    
}

-(instancetype)init
{
    self=[super init];
    if (self) {
        self.frame=CGRectMake(0, 0, 160, 40);
        self.clipsToBounds=YES;
        _textColor=[UIColor blackColor];
        _textFont=[UIFont systemFontOfSize:26];
        self.numbersOfChar=4;
        // BGView
        if (!_bgImgView) {
            _bgImgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 40)];
            [self addSubview:_bgImgView];
        }
        if (!_tf)
        {
            _tf=[[UITextField alloc] initWithFrame:CGRectMake(0, -20, 20, 10)];
            _tf.keyboardType=UIKeyboardTypeNumberPad;
            _tf.delegate=self;
            [self addSubview:_tf];
        }
        
    }
    
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.frame=frame;
        self.backgroundColor=[UIColor whiteColor];
        self.clipsToBounds=YES;
        _textColor=[UIColor blackColor];
        _textFont=[UIFont systemFontOfSize:26];
        self.numbersOfChar=4;
        // BGView
        if (!_bgImgView) {
            _bgImgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            [self addSubview:_bgImgView];
        }
        if (!_tf)
        {
            _tf=[[UITextField alloc] initWithFrame:CGRectMake(0, -20, 20, 10)];
            _tf.keyboardType=UIKeyboardTypeNumberPad;
            _tf.delegate=self;
            [self addSubview:_tf];
        }
        
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame andBGImage:(UIImage * )bgImage andNumbersOfChar:(NSUInteger)number andFont:(UIFont *)font andTextColor:(UIColor *)textColor
{
    self=[super initWithFrame:frame];
    if (self){
        self.frame=frame;
        self.clipsToBounds=YES;
        self.backgroundColor=bgImage?[UIColor clearColor]:[UIColor whiteColor];
        // BGView
        if (!_bgImgView) {
            _bgImgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _bgImgView.image=bgImage;
            _backGroundImage=bgImage;
            [self addSubview:_bgImgView];
        }
        self.numbersOfChar=4;
                // textfile
        if (!_tf) {
            _tf=[[UITextField alloc] initWithFrame:CGRectMake(0, -20, 20, 10)];
            _tf.keyboardType=UIKeyboardTypeNumberPad;
            _tf.delegate=self;
            [self addSubview:_tf];
        }
        
    }
    return self;
}

-(void)setBackGroundImage:(UIImage *)backGroundImage
{
    _backGroundImage=backGroundImage;
    _bgImgView.image=backGroundImage;
    self.backgroundColor=backGroundImage?[UIColor clearColor]:[UIColor whiteColor];
}

-(void)setNumbersOfChar:(NSUInteger)numbersOfChar
{
    
    _numbersOfChar=numbersOfChar;
    
    if (_allLabels.count>0) {
        [_allLabels removeAllObjects];
        for (id obj in self.subviews) {
            if ([obj isKindOfClass:[LZZSecuTextField class]]) {
                [obj removeFromSuperview];
            }
        }
    }else{
        _allLabels=[NSMutableArray array];
    }
    
    
    for (int i=0; i<numbersOfChar; i++) {
        LZZSecuLabel * label =[[LZZSecuLabel alloc] initWithFrame:CGRectMake(i*(self.frame.size.width/numbersOfChar), 0, self.frame.size.width/numbersOfChar, self.frame.size.height)];
        // setting lable
        label.tag=i;
        label.backgroundColor=[UIColor clearColor];
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor=_textColor?_textColor:[UIColor blackColor];
        label.font=_textFont?_textFont:[UIFont systemFontOfSize:26];
        [_allLabels addObject:label];
        [self addSubview:label];
        [self bringSubviewToFront:label];
    }
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [_bgImgView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    if (_allLabels.count>0) {
        
        for (int i=0; i<_allLabels.count; i++) {
            LZZSecuLabel * label=_allLabels[i];
            [label setFrame:CGRectMake(i*(frame.size.width/_allLabels.count), 0, frame.size.width/_allLabels.count, frame.size.height)];
        }
        
    }
}

-(void)setTextColor:(UIColor *)textColor{
    _textColor=textColor;
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[LZZSecuLabel class]]) {
            LZZSecuLabel * label=obj;
            label.textColor=textColor;
        }
    }
}

-(void)setTextFont:(UIFont *)textFont
{
    _textFont=textFont;
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[LZZSecuLabel class]]) {
            LZZSecuLabel * label=obj;
            label.font=textFont;
        }
    }
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_tf becomeFirstResponder];
}
-(void)showKeyBoard{
    [_tf becomeFirstResponder];
}
-(void)hideKeyBoard{
    [_tf resignFirstResponder];
}
-(void)setKeyBoardType:(UIKeyboardType)keyBoardType{
    _keyBoardType=keyBoardType;
    _tf.keyboardType=keyBoardType;

}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"rang.length=%lu rang.location=%lu string=%@",(unsigned long)range.length,(unsigned long)range.location,string);
    if ([string isEqualToString:@" "]) {
        return NO;
    }
    if (range.location+1>_numbersOfChar) {
        return NO;
    }
    
    LZZSecuLabel * label=_allLabels[range.location];
    if (string.length>0) {
        // 输入
        [label setSecuText:string];
        if (range.location>0) {
            LZZSecuLabel * lastLabel=_allLabels[range.location-1];
            [lastLabel changeToSecuText];
        }
    }else{
        // 退格
        label.originalText=string;
        label.text=string;
    }
    // password value
    _passWord=@"";
    for (int i=0; i<_numbersOfChar; i++) {
        LZZSecuLabel * label=_allLabels[i];
        _passWord=[_passWord stringByAppendingString:label.originalText];
    }
    return YES;
}



-(void)dealloc{
    NSLog(@"textField dealloced!");
}







@end
