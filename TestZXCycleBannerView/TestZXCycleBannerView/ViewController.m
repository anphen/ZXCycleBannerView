//
//  ViewController.m
//  TestZXCycleBannerView
//
//  Created by xu zhao on 2018/9/10.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "ViewController.h"
#import "ZXCycleBannerView.h"

#define kRandomColor  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@interface ViewController ()<ZXCycleBannerViewDelegate, ZXCycleBannerViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZXCycleBannerView *bannerView = [[ZXCycleBannerView alloc]initWithFrame:CGRectMake(0, 240, self.view.frame.size.width, self.view.frame.size.width * 110 /169.0)];
    bannerView.delegate = self;
    bannerView.dataSource = self;
    [self.view addSubview:bannerView];
    bannerView.autoScrollTimeInterval = 3.0;
    bannerView.autoScroll = YES;
    bannerView.showPageControl = YES;
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
