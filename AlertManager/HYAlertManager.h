//
//  HYAlertManager.h
//  AlertManager
//
//  Created by Mac on 2019/1/25.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface HYAlertManager : NSObject

+(instancetype)shareManager;


-(void)alertTitle:(NSString *)title message:(NSString *)message commit:(SEL)commitMethod object:(id)object;

@end


