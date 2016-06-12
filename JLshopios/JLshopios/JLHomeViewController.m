//
//  JLHomeViewController.m
//  JLshopios
//
//  Created by imao on 16/6/5.
//  Copyright © 2016年 feng. All rights reserved.
//

#import "JLHomeViewController.h"
#import "JLShopCollectionViewCell.h"
#import "SDCycleScrollView.h"
#import "JLTypeListView.h"

#define JLHomeCell @"JLHomeViewShopingCell"


@interface JLHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *topView;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) SDCycleScrollView *cycleScrollview;
@property (weak, nonatomic) IBOutlet UIView *topSearchView;

@property (nonatomic,strong) JLTypeListView *typeListView;

@end

@implementation JLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.topSearchView.layer.cornerRadius = 6;
    self.topSearchView.layer.borderColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1].CGColor;
    self.topSearchView.layer.borderWidth = 1;
    
    [self loadCollectionView];
}

-(void)loadCollectionView{
//    self.collectionView = [[UICollectionView alloc]init];
    
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc] init];
    
    layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical]; // 垂直滚动
    [layout setHeaderReferenceSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 270)];
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
            make.top.mas_equalTo(self.topView.mas_bottom);
            make.left.mas_equalTo(pview);
            make.width.mas_equalTo(pview.mas_width);
            make.height.mas_equalTo(pview.mas_height);
        }];
    }
    
    [_collectionView registerNib:[UINib nibWithNibName:@"JLShopCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:JLHomeCell];

    self.collectionView.mj_header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [self.collectionView.mj_header endRefreshing];
    }];
    
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.collectionView.mj_footer endRefreshing];
    }];
    [self loadSrollView];
    [self loadJLTypeListView];
}



-(void)loadSrollView{
    CGFloat creenWidth = [UIScreen mainScreen].bounds.size.width;
    self.cycleScrollview = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, creenWidth, 140) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    _cycleScrollview.currentPageDotImage = [UIImage imageNamed:@"FYTXCategories_page_dot_press"];
//    _cycleScrollview.pageDotImage = [UIImage imageNamed:@"FYTXCategories_page_dot"];
    _cycleScrollview.imageURLStringsGroup = @[@"guide_page_1",@"guide_page_2",@"guide_page_3"];
    _cycleScrollview.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    [self.collectionView addSubview:_cycleScrollview];
    
    {
        SDCycleScrollView *sview = _cycleScrollview;
        UIView *pview = self.collectionView;
        [pview addSubview:sview];
        [sview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(pview);
            make.left.mas_equalTo(pview);
            make.width.mas_equalTo(creenWidth);
            make.height.mas_equalTo(140);
        }];
    }
}

-(void)loadJLTypeListView{
    self.typeListView = [[JLTypeListView alloc]init];
    {
        UIView *sview = self.typeListView;
        UICollectionView *pview = self.collectionView;
        [pview addSubview:sview];
        [sview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(pview);
            make.top.mas_equalTo(self.cycleScrollview.mas_bottom);
            make.width.mas_equalTo(pview);
            make.height.mas_equalTo(130);
        }];
    }
    
    
}





- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
//    [[self.viewModel openBannerWith:index]execute:nil];
}











#pragma collectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

        JLShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:JLHomeCell forIndexPath:indexPath];

    
    
    return cell;
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width/2;

    CGSize bsize = CGSizeMake(cellWidth, 100);

    return bsize;
}

//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    
    return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
}

//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

@end
