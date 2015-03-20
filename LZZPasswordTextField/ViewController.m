//
//  ViewController.m
//  LZZPasswordTextField
//
//  Created by ucs on 15/3/20.
//  Copyright (c) 2015年 lzz. All rights reserved.
//

#import "ViewController.h"
#import "LZZSecuTextField.h"

@interface ViewController ()
@property (strong, nonatomic)LZZSecuTextField *sTf;

@property (strong, nonatomic) IBOutlet UILabel *showLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    _sTf=[[LZZSecuTextField alloc] initWithFrame:CGRectMake(40, 40, 160, 40) andBGImage:[UIImage imageNamed:@"tf"] andNumbersOfChar:4 andFont:nil andTextColor:nil];
    [self.view addSubview:_sTf];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[_sTf hideKeyBorad];
    [self.view endEditing:YES];

}



- (IBAction)showPassWord:(id)sender {
    
    _showLabel.text=_sTf.passWord;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
