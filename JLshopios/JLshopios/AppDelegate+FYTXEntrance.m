//
//  AppDelegate+FYTXEntrance.m
//  FYTXMain
//
//  Created by tiger on 15/6/12.
//  Copyright (c) 2015年 tiger. All rights reserved.
//

#import "AppDelegate+FYTXEntrance.h"
//#import "FYTXMainNavigationController.h"
#import "JLTabMainController.h"
#import "JLHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate(FYTXEntrance)


-(void) loadAppGuide
{    
    //开屏页
//    self.window.rootViewController = (UIViewController *)[FYTXFlashFactory flashView];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[JLTabMainController alloc]init];
    
    
    
    [self.window makeKeyAndVisible];
//    
////    self.window.rootViewController = [[JLTabMainController alloc]init];
//    [UIApplication sharedApplication].keyWindow.rootViewController = [[JLTabMainController alloc]init];
//    
//    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
//    
    
//    [self.window makeKeyAndVisible];
    
    //直接跳转到tablebar页面;
    
    
}


























































@end
