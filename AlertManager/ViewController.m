//
//  ViewController.m
//  AlertManager
//
//  Created by Mac on 2019/1/25.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "HYAlertManager.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 100, 50, 30);
    [btn setTitle:@"弹框" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 250, 30)];
    [self.view addSubview:self.label];
}

-(void)btnClick{
    
    [[HYAlertManager shareManager] alertTitle:@"提示" message:@"即将显示当前时间" commit:@selector(commit) object:self];
}

-(void)commit{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [NSDate new];
    self.label.text = [formatter stringFromDate:date];
}

@end
