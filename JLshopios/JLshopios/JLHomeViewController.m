//
//  JLHomeViewController.m
//  JLshopios
//
//  Created by imao on 16/6/5.
//  Copyright © 2016年 feng. All rights reserved.
//

#import "JLHomeViewController.h"

@interface JLHomeViewController ()

@end

@implementation JLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor greenColor]];
    // Do any additional setup after loading the view.
    
    NSString *url = @"https://123.56.192.182:8443/admin/shop/ajaxGetShopById?shopId=1";
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    [dict setObject:@"arg0" forKey:@"getLoginUser"];
//    [dict setObject:@"18643212316" forKey:@"loginName"];
//    [dict setObject:@"96E79218965EB72C92A549DD5A330112" forKey:@"password"];
    [QSCHttpTool get:url parameters:nil isShowHUD:NO httpToolSuccess:^(id json) {
        MYLog(@"%@",json);
    } failure:^(NSError *error) {
        MYLog(@"%@",error);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
