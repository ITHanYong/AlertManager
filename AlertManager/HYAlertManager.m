//
//  HYAlertManager.m
//  AlertManager
//
//  Created by Mac on 2019/1/25.
//  Copyright © 2019年 Mac. All rights reserved.
//

//传递函数、参数
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


#import "HYAlertManager.h"

@implementation HYAlertManager

static HYAlertManager *alertManager = nil;
+(instancetype)shareManager{
    @synchronized ([HYAlertManager class]) {
        if (alertManager == nil) {
            alertManager = [[HYAlertManager alloc] init];
        }
    }
    return alertManager;
}

+(instancetype)alloc{
    @synchronized ([HYAlertManager class]) {
        alertManager = [super alloc];
    }
    return alertManager;
}


-(void)alertTitle:(NSString *)title message:(NSString *)message commit:(SEL)commitMethod object:(id)object{
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        SuppressPerformSelectorLeakWarning([object performSelector:commitMethod withObject:nil]);
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    // 弹出对话框
    [object presentViewController:alert animated:true completion:nil];
    
}

@end
