//
//  JLTabMainController.m
//  JLshopios
//
//  Created by imao on 16/6/5.
//  Copyright © 2016年 feng. All rights reserved.
//

#import "JLTabMainController.h"
#import "JLHomeViewController.h"
#import "JLLoginViewController.h"
#import "JLMeViewController.h"
#import "JLHomeViewController.h"
#import "JLShopsViewController.h"
<<<<<<< HEAD

#import "JLFindViewController.h"



=======
#import "CategoryViewController.h"
#import "ShopingCartController.h"
>>>>>>> shop/zhou_company

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
<<<<<<< HEAD
    

    JLHomeViewController *vcHome = [JLHomeViewController viewController:ShopSBNameHome];
    vcHome.title = @"首页";
    JLBaseNavigationController *bnHome = [[JLBaseNavigationController alloc]initWithRootViewController:vcHome];
    
//    [vcHome setNm_wantsNavigationBarVisible:NO];
    
    JLCategoryViewController *vcCate = [[JLCategoryViewController alloc]init];
    vcCate.title = @"分类";

    JLBaseNavigationController *bnCate = [[JLBaseNavigationController alloc]initWithRootViewController:vcCate];
=======
    JLHomeViewController *vcHome = [[JLHomeViewController alloc]init];
    QSCNavigationController *bnHome = [[QSCNavigationController alloc]initWithRootViewController:vcHome];
    
//    [vcHome setNm_wantsNavigationBarVisible:NO];
    
    CategoryViewController *vcCate = [[CategoryViewController alloc]init];
    QSCNavigationController *bnCate = [[QSCNavigationController alloc]initWithRootViewController:vcCate];
>>>>>>> shop/zhou_company
    
    
    JLFindViewController *vcFind = [JLFindViewController viewController:ShopSBNameFind];
    JLBaseNavigationController *bnFind = [[JLBaseNavigationController alloc]initWithRootViewController:vcFind];
    vcFind.title = @"发现";
    
    
    JLShopsViewController *vcShop = [[JLShopsViewController alloc]init];
<<<<<<< HEAD
    vcShop.title = @"商家";
    
    JLBaseNavigationController *bnShop = [[JLBaseNavigationController alloc]initWithRootViewController:vcShop];
    
    JLMeViewController *vcMe = [[JLMeViewController alloc]init];
    vcMe.title = @"我的";
    JLBaseNavigationController *bnMe = [[JLBaseNavigationController alloc]initWithRootViewController:vcMe];
    
    [self setViewControllers:@[bnHome,bnCate,bnFind,bnShop,bnMe]animated:YES];
=======
    QSCNavigationController *bnShop = [[QSCNavigationController alloc]initWithRootViewController:vcShop];
    
    ShopingCartController *cart  = [[ShopingCartController alloc] init];
    QSCNavigationController *shopNav = [[QSCNavigationController alloc] initWithRootViewController:cart];
    
    JLMeViewController *vcMe = [[JLMeViewController alloc]init];
    QSCNavigationController *bnMe = [[QSCNavigationController alloc]initWithRootViewController:vcMe];
    
    [self setViewControllers:@[bnHome,bnCate,bnShop,shopNav,bnMe]animated:YES];
>>>>>>> shop/zhou_company

    self.selectedIndex = 0;
    
    [self tabBarItemWithTitle:@"首页" imageName:@""
            selectedImageName:@"" index:0];
    [self tabBarItemWithTitle:@"分类" imageName:@""
            selectedImageName:@"" index:1];
    [self tabBarItemWithTitle:@"发现" imageName:@"" selectedImageName:@"" index:2];
    [self tabBarItemWithTitle:@"商铺" imageName:@""
<<<<<<< HEAD
            selectedImageName:@"" index:3];
    [self tabBarItemWithTitle:@"我的" imageName:@""
            selectedImageName:@"" index:4];
    [self loadBgView];
    
=======
            selectedImageName:@"" index:2];
    [self tabBarItemWithTitle:@"购物车" imageName:@""
            selectedImageName:@"" index:3];
    [self tabBarItemWithTitle:@"我的" imageName:@""
            selectedImageName:@"" index:4];
>>>>>>> shop/zhou_company
}

-(void)loadBgView{
    UIView *bgview = [[UIView alloc]init];
    
    [bgview setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 48)];
    [bgview setBackgroundColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]];
    
    
    [self.tabBar insertSubview:bgview atIndex:0];
    

    
    
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
