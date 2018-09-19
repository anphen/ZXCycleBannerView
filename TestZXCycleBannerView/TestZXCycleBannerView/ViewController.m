//
//  ViewController.m
//  TestZXCycleBannerView
//
//  Created by xu zhao on 2018/9/10.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "ViewController.h"
#import "ZXCycleBannerView.h"
#import "ZXPinProductsView.h"
#import "ZXBrandPinProductsView.h"

//#define pin
#define pinBrand

@interface ViewController ()<ZXCycleBannerViewDelegate, ZXCycleBannerViewDataSource, ZXPinProductViewDelegate, ZXBrandPinSingleProductViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    ZXCycleBannerView *bannerView = [[ZXCycleBannerView alloc]initWithFrame:CGRectMake(0, 240, self.view.frame.size.width, self.view.frame.size.width * 110 /169.0)];
//    bannerView.delegate = self;
//    bannerView.dataSource = self;
//    [self.view addSubview:bannerView];
//    bannerView.autoScrollTimeInterval = 3.0;
//    bannerView.autoScroll = YES;
//    bannerView.showPageControl = YES;
#ifdef pin
    ZXPinProductsView *view = [[ZXPinProductsView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, [ZXPinProductsView cellHeightWithType:ZXPinProductViewTypePinCount])];
    [view configCellWithProducts:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"]
                            type:ZXPinProductViewTypePinCount];
    view.delegate = self;
    [self.view addSubview:view];
#endif
    
#ifdef pinBrand
    ZXBrandPinProductsView *view1 = [[ZXBrandPinProductsView alloc]initWithFrame:CGRectMake(0, 400, self.view.frame.size.width ,175)];
    [view1 configCellWithProductArray:@[@"1",@"2"]];
    view1.delegate = self;

    [self.view addSubview:view1];
#endif
}

- (void)clickBrandProdView:(ZXBrandPinSingleProductView *)prodView atIndex:(NSInteger)index{
    NSLog(@"======== index = %li =====", index);
}

- (void)clickProdView:(ZXPinProductView *)prodView atIndex:(NSInteger)index{
    NSLog(@"======== index = %li =====", index);
}

- (NSInteger)numberOfItemsZXCycleBannerView:(ZXCycleBannerView *)bannerView{
    return 5;
}

- (UIView *)bannerView:(ZXCycleBannerView *)bannerView
    viewForItemAtIndex:(NSInteger)index{
    NSString *reuseId = [NSString stringWithFormat:@"zxbannerviewIdentifier%li", index];
    UIView *view = [bannerView dequeueReuseViewWithReuseIdentifier:reuseId forIndex:index];
    if (!view) {
        view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, bannerView.frame.size.width, bannerView.frame.size.height)];
        view.backgroundColor = kRandomColor;
        view.reuseIdentifier = reuseId;
        UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        textLabel.text = [NSString stringWithFormat:@"%li", index];
        [view addSubview:textLabel];
    }
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
