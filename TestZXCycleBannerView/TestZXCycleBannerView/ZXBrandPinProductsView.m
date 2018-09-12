//
//  ZXBrandPinProductsView.m
//  TestZXCycleBannerView
//
//  Created by xu zhao on 2018/9/12.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "ZXBrandPinProductsView.h"
#import "ZXCycleBannerView.h"
#import "Masonry.h"

@interface ZXBrandPinSingleProductView()<ZXBrandPinSingleProductViewDelegate>

@property (nonatomic, weak) id<ZXBrandPinSingleProductViewDelegate> delegate;

@property (nonatomic, strong) UIImageView *prodImageView;

@property (nonatomic, strong) UILabel *prodTitle;

@property (nonatomic, strong) UILabel *prodSubTitle;

@property (nonatomic, strong) UIImageView *progressBar;

@property (nonatomic, strong) UILabel *progressBarTitle;

@property (nonatomic, strong) UILabel *pinPeopleTitle;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) UILabel *linePriceLabel;

@property (nonatomic, strong) UIButton *pinHandelButton;

@end

@implementation ZXBrandPinSingleProductView

- (instancetype)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)]];
        self.backgroundColor = kRandomColor;
        self.prodImageView = [[UIImageView alloc]init];
        self.prodTitle = [[UILabel alloc]init];
        self.prodSubTitle = [[UILabel alloc]init];
        self.progressBar  = [[UIImageView alloc]init];
        self.progressBarTitle = [[UILabel alloc]init];
        self.pinPeopleTitle = [[UILabel alloc]init];
        self.priceLabel = [[UILabel alloc]init];
        self.linePriceLabel = [[UILabel alloc]init];
        self.pinHandelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        self.prodImageView.backgroundColor = kRandomColor;
        self.prodTitle.backgroundColor = kRandomColor;
        self.prodSubTitle.backgroundColor = kRandomColor;
        self.progressBar.backgroundColor = kRandomColor;
        self.progressBarTitle.backgroundColor = kRandomColor;
        self.pinPeopleTitle.backgroundColor = kRandomColor;
        self.priceLabel.backgroundColor = kRandomColor;
        self.linePriceLabel.backgroundColor = kRandomColor;
        self.pinHandelButton.backgroundColor = kRandomColor;

        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    [self addSubview:self.prodImageView];
    [self addSubview:self.prodTitle];
    [self addSubview:self.prodSubTitle];
    [self addSubview:self.progressBar];
    [self.progressBar addSubview:self.progressBarTitle];
    [self addSubview:self.pinPeopleTitle];
    [self addSubview:self.priceLabel];
    [self addSubview:self.linePriceLabel];
    [self addSubview:self.pinHandelButton];
    [self.prodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(12);
        make.bottom.mas_equalTo(-12);
        make.width.mas_equalTo(self.prodImageView.mas_height);
    }];
    [self.prodTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.mas_equalTo(self.prodImageView.mas_right).offset(9);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(14);
    }];
    [self.prodSubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.prodTitle.mas_left);
        make.top.mas_equalTo(self.prodTitle.mas_bottom).offset(9);
        make.right.mas_equalTo(self.prodTitle.mas_right);
        make.height.mas_equalTo(12);
    }];
    [self.progressBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.prodTitle.mas_left);
        make.top.mas_equalTo(self.prodSubTitle.mas_bottom).offset(9);
        make.width.mas_equalTo(84);
        make.height.mas_equalTo(12);
    }];
    [self.progressBarTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(0);
        make.width.mas_equalTo(66);
    }];
    [self.pinPeopleTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.progressBar.mas_right).offset(9);
        make.centerY.mas_equalTo(self.progressBar.mas_centerY);
        make.width.mas_equalTo(31.5);
        make.height.mas_equalTo(12);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.prodTitle.mas_left);
        make.top.mas_equalTo(self.progressBar.mas_bottom).offset(9);
        make.width.mas_equalTo(55.5);
        make.height.mas_equalTo(16);
    }];
    [self.linePriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.priceLabel.mas_right).offset(6);
        make.bottom.mas_equalTo(self.priceLabel.mas_bottom);
        make.width.mas_equalTo(34);
        make.height.mas_equalTo(12);
    }];
    [self.pinHandelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.prodTitle.mas_right);
        make.bottom.mas_equalTo(self.priceLabel.mas_bottom);
        make.width.mas_equalTo(72);
        make.height.mas_equalTo(24);
    }];
}

- (void)setProduct:(id)product{
    _product = product;
    //TODO 填数据
    self.priceLabel.text = product;
}

- (void)click{
    if ([self.delegate respondsToSelector:@selector(clickBrandProdView:)]) {
        [self.delegate clickBrandProdView:self];
    }
}

@end

@interface ZXBrandPinProductsView()<ZXCycleBannerViewDelegate, ZXCycleBannerViewDataSource, ZXBrandPinSingleProductViewDelegate>

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) ZXCycleBannerView *mainBannerView;

@property (nonatomic, strong) NSArray *prodsArray;

@end

@implementation ZXBrandPinProductsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.bgImageView.backgroundColor = kRandomColor;
        self.mainBannerView = [[ZXCycleBannerView alloc]initWithFrame:CGRectMake(0, 40, self.frame.size.width, self.frame.size.height - 40)];
        self.mainBannerView.dataSource = self;
        self.mainBannerView.delegate = self;
        self.mainBannerView.autoScroll = YES;
        self.mainBannerView.infiniteLoop = YES;
        self.mainBannerView.showPageControl = YES;
        [self addSubview:self.bgImageView];
        [self addSubview:self.mainBannerView];
        self.mainBannerView.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (NSInteger)numberOfItemsZXCycleBannerView:(ZXCycleBannerView *)bannerView{
    return self.prodsArray.count;
}

- (UIView *)bannerView:(ZXCycleBannerView *)bannerView viewForItemAtIndex:(NSInteger)index{
    NSString *reuseId = [NSString stringWithFormat:@"ZXBrandProductView%li", index];

    ZXBrandPinSingleProductView *view = (ZXBrandPinSingleProductView *)[bannerView dequeueReuseViewWithReuseIdentifier:reuseId forIndex:index];
    if (!view) {
        view = [[ZXBrandPinSingleProductView alloc]initWithFrame:CGRectMake(12, 0, self.frame.size.width - 24, 114)];
        view.delegate = self;
        view.reuseIdentifier = reuseId;
        view.product = [self.prodsArray objectAtIndex:index];
    }
    return view;
}

- (void)clickBrandProdView:(ZXBrandPinSingleProductView *)prodView{
    if ([self.delegate respondsToSelector:@selector(clickBrandProdView:)]) {
        [self.delegate clickBrandProdView:prodView];
    }
    if ([self.delegate respondsToSelector:@selector(clickBrandProdView:atIndex:)]) {
        NSInteger index = [self.prodsArray indexOfObject:prodView.product];
        [self.delegate clickBrandProdView:prodView atIndex:index];
    }
}

- (void)configCellWithProductArray:(NSArray *)products{
    self.prodsArray = products;
    [self.mainBannerView reload];
}

@end
