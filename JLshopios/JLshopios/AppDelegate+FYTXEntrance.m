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

#import "FYTXGuide.h"
#import "JLGuideViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate(FYTXEntrance)


-(void) loadAppGuide
{    
    //开屏页
    [self loadNotification];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    BOOL isGCshow = [FYTXGuide isHiddenFYTXGuide];
    if (isGCshow) {
        self.window.rootViewController = [[JLTabMainController alloc]init];
    }else{
        JLGuideViewController *gc = [[JLGuideViewController alloc]init];
        self.window.rootViewController = gc;
    }
    

    [self.window makeKeyAndVisible];
}


-(void)loadNotification{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(jumptoMainController) name:@"JLShopGuideFinishGoToMain" object:nil];
}

-(void)jumptoMainController{
    self.window.rootViewController = [[JLTabMainController alloc]init];

}























































@end
