//
//  JLHomeViewController.m
//  JLshopios
//
//  Created by imao on 16/6/5.
//  Copyright © 2016年 feng. All rights reserved.
//

#import "JLHomeViewController.h"

@interface JLHomeViewController ()
@property (weak, nonatomic) IBOutlet UIView *topView;

@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation JLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor greenColor]];
    // Do any additional setup after loading the view.
    
//    NSString *url = @"https://123.56.192.182:8443/admin/shop/ajaxGetShopById?shopId=1";
////    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
////    [dict setObject:@"arg0" forKey:@"getLoginUser"];
////    [dict setObject:@"18643212316" forKey:@"loginName"];
////    [dict setObject:@"96E79218965EB72C92A549DD5A330112" forKey:@"password"];
//    [QSCHttpTool get:url parameters:nil isShowHUD:NO httpToolSuccess:^(id json) {
//        MYLog(@"%@",json);
//    } failure:^(NSError *error) {
//        MYLog(@"%@",error);
//    }];
//    
    
}

-(void)loadCollectionView{
//    self.collectionView = [[UICollectionView alloc]init];
    
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc] init];
    
    layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 0;
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical]; // 垂直滚动
    [layout setHeaderReferenceSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 200)];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    
    self.collectionView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:247/255.0 alpha:1];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.collectionView.scrollsToTop = YES;
    
    {
        UIView *pview = self.view;
        UICollectionView *sview = self.collectionView;
        [pview addSubview:sview];
        
        [sview mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(pview);
            make.left.mas_equalTo(pview);
            make.width.mas_equalTo(pview.mas_width);
            make.height.mas_equalTo(pview.mas_height);
        }];
    }
    
//    [_collectionView registerNib:[UINib nibWithNibName:@"FYTXCategoriesNewBigCell" bundle:nil] forCellWithReuseIdentifier:fChatRoomNewBigCell];
//    
//    [_collectionView registerNib:[UINib nibWithNibName:@"FYTXCategoriesNewSmallCell" bundle:nil] forCellWithReuseIdentifier:fChatRoomNewSmallCell];
    

    
    
    self.collectionView.mj_header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
//        [weakSelf headerRefreshing];
    }];
    
    
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
//        [weakSelf.viewModel loadDataisHeader:NO];
    }];
    

    
}



@end
