//
//  JLTabMainController.m
//  JLshopios
//
//  Created by imao on 16/6/5.
//  Copyright © 2016年 feng. All rights reserved.
//

#import "JLTabMainController.h"

#import "JLBaseNavigationController.h"

#import "JLHomeViewController.h"
#import "JLLoginViewController.h"
#import "JLMeViewController.h"
#import "JLHomeViewController.h"
#import "JLShopsViewController.h"
#import "CategoryViewController.h"





@interface JLTabMainController ()

@end

@implementation JLTabMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadControllers];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadControllers{
    JLHomeViewController *vcHome = [[JLHomeViewController alloc]init];
    QSCNavigationController *bnHome = [[QSCNavigationController alloc]initWithRootViewController:vcHome];
    
//    [vcHome setNm_wantsNavigationBarVisible:NO];
    
    CategoryViewController *vcCate = [[CategoryViewController alloc]init];
    QSCNavigationController *bnCate = [[QSCNavigationController alloc]initWithRootViewController:vcCate];
    
    JLShopsViewController *vcShop = [[JLShopsViewController alloc]init];
    QSCNavigationController *bnShop = [[QSCNavigationController alloc]initWithRootViewController:vcShop];
    
    JLMeViewController *vcMe = [[JLMeViewController alloc]init];
    QSCNavigationController *bnMe = [[QSCNavigationController alloc]initWithRootViewController:vcMe];
    
    [self setViewControllers:@[bnHome,bnCate,bnShop,bnMe]animated:YES];

    self.selectedIndex = 0;
    
    [self tabBarItemWithTitle:@"首页" imageName:@""
            selectedImageName:@"" index:0];
    [self tabBarItemWithTitle:@"分类" imageName:@""
            selectedImageName:@"" index:1];
    [self tabBarItemWithTitle:@"商铺" imageName:@""
            selectedImageName:@"" index:2];
    [self tabBarItemWithTitle:@"我的" imageName:@""
            selectedImageName:@"" index:3];
}




-(void) tabBarItemWithTitle:(NSString *)atitle imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName  index:(NSInteger)index
{
    UITabBarItem *tabBarItem = [self.tabBar.items objectAtIndex:index];
    tabBarItem.title = atitle;
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIColor colorWithRed:0x7a/255.0 green:0x49/255.0 blue:0xdf/255.0 alpha:1.0], UITextAttributeTextColor,
                                        nil] forState:UIControlStateSelected];
    tabBarItem.imageInsets=UIEdgeInsetsMake(6, 0,-6, 0);
    
    if ( imageName != nil && selectedImageName != nil  ) {
        UIImage *unselectedImage = [UIImage imageNamed:imageName];
        UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
        [tabBarItem setImage: [unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [tabBarItem setSelectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
}


@end
