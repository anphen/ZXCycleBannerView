//
//  ZXPinProductsCell.m
//  TestZXCycleBannerView
//
//  Created by xu zhao on 2018/9/11.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "ZXPinProductsView.h"
#import "ZXCycleBannerView.h"
#import "Masonry.h"

@interface ZXPinProductView()

@property (nonatomic, weak) id<ZXPinProductViewDelegate> delegate;

@property (nonatomic, strong) UIImageView *prodImageView;

@property (nonatomic, strong) UILabel *pinPeopleNumberLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) UILabel *linePriceLabel;

@property (nonatomic, strong) UILabel *pinProdCountLabel;

@property (nonatomic, assign) ZXPinProductViewType type;

@end


@implementation ZXPinProductView

- (instancetype)initWithType:(ZXPinProductViewType)type delegete:(id)delegate
{
    self = [super init];
    if (self) {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)]];
        self.delegate = delegate;
        self.type = type;
        self.backgroundColor = kRandomColor;
    }
    return self;
}

- (void)setType:(ZXPinProductViewType)type{
    self.prodImageView = [[UIImageView alloc]init];
    self.prodImageView.backgroundColor = kRandomColor;
    self.pinPeopleNumberLabel = [[UILabel alloc]init];
    self.pinPeopleNumberLabel.backgroundColor = kRandomColor;
    self.priceLabel = [[UILabel alloc]init];
    self.priceLabel.backgroundColor = kRandomColor;
    self.linePriceLabel = [[UILabel alloc]init];
    self.linePriceLabel.backgroundColor = kRandomColor;
    self.pinProdCountLabel = [[UILabel alloc]init];
    self.pinProdCountLabel.backgroundColor = kRandomColor;
    [self addSubview:self.prodImageView];
    [self addSubview:self.pinPeopleNumberLabel];
    [self.prodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(self.prodImageView.mas_width);
    }];
    [self.pinPeopleNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.prodImageView.mas_bottom).offset(3);
        make.width.mas_equalTo(38);
        make.height.mas_equalTo(12);
    }];
    switch (type) {
        case ZXPinProductViewTypeNormal:
        {
            [self addSubview:self.priceLabel];
            [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self.mas_centerX);
                make.top.mas_equalTo(self.pinPeopleNumberLabel.mas_bottom).offset(7);
                make.width.mas_equalTo(39.5);
                make.height.mas_equalTo(16);
            }];
            
        }
            break;
        case ZXPinProductViewTypeLinePrice:
        {
            [self addSubview:self.priceLabel];
            [self addSubview:self.linePriceLabel];
            [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.pinPeopleNumberLabel.mas_bottom).offset(7);
                make.right.mas_equalTo(self.mas_centerX).offset(-3);
                make.width.mas_equalTo(39.5);
                make.height.mas_equalTo(16);
            }];
            [self.linePriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self.priceLabel.mas_bottom);
                make.left.mas_equalTo(self.priceLabel.mas_right).offset(6);
                make.width.mas_equalTo(26.5);
                make.height.mas_equalTo(12);
            }];
        }
            break;
        case ZXPinProductViewTypePinCount:
        {
            [self addSubview:self.priceLabel];
            [self addSubview:self.linePriceLabel];
            [self addSubview:self.pinProdCountLabel];
            [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.pinPeopleNumberLabel.mas_bottom).offset(7);
                make.right.mas_equalTo(self.mas_centerX).offset(-3);
                make.width.mas_equalTo(39.5);
                make.height.mas_equalTo(16);
            }];
            [self.linePriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self.priceLabel.mas_bottom);
                make.left.mas_equalTo(self.priceLabel.mas_right).offset(6);
                make.width.mas_equalTo(26.5);
                make.height.mas_equalTo(12);
            }];
            [self.pinProdCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.priceLabel.mas_bottom).offset(3);
                make.centerX.mas_equalTo(self.mas_centerX);
                make.width.mas_equalTo(59.5);
                make.height.mas_equalTo(11);
            }];
            
        }
            break;
            
        default:
            break;
    }
}

- (void)setProduct:(id)product{
    _product = product;
    //TODO 填数据
    self.priceLabel.text = product;
}

- (void)click{
    if ([self.delegate respondsToSelector:@selector(clickProdView:)]) {
        [self.delegate clickProdView:self];
    }
}

@end

@interface ZXPinThreeProductView : UIView<ZXPinProductViewDelegate>

@property (nonatomic, strong) NSArray *products;
@property (nonatomic, strong) ZXPinProductView *firstProd;
@property (nonatomic, strong) ZXPinProductView *secondProd;
@property (nonatomic, strong) ZXPinProductView *thirdProd;
@property (nonatomic, assign) ZXPinProductViewType type;

@property (nonatomic, weak) id<ZXPinProductViewDelegate> delegate;


@end

@implementation ZXPinThreeProductView

- (instancetype)initWithType:(ZXPinProductViewType)type
{
    self = [super init];
    if (self) {
        self.type = type;
        self.firstProd = [[ZXPinProductView alloc]initWithType:type delegete:self];
        self.secondProd = [[ZXPinProductView alloc]initWithType:type delegete:self];
        self.thirdProd = [[ZXPinProductView alloc]initWithType:type delegete:self];
        self.backgroundColor = kClearColor;
        [self addSubview:self.firstProd];
        [self addSubview:self.secondProd];
        [self addSubview:self.thirdProd];
        [self.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:6 leadSpacing:16 tailSpacing:16];
        [self.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
        }];
    }
    return self;
}

- (void)setProducts:(NSArray *)products{
    _products = products;
    self.firstProd.product = [products objectAtIndex:0];
    self.secondProd.product = [products objectAtIndex:1];
    self.thirdProd.product = [products objectAtIndex:2];
}

- (void)clickProdView:(ZXPinProductView *)prodView{
    if ([self.delegate respondsToSelector:@selector(clickProdView:)]) {
        [self.delegate clickProdView:prodView];
    }
}

@end

@interface ZXPinProductsView()<ZXCycleBannerViewDelegate, ZXCycleBannerViewDataSource, ZXPinProductViewDelegate>

@property (nonatomic, strong) ZXCycleBannerView *mainScrollView;
@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) NSArray *productsArray;
@property (nonatomic, assign) ZXPinProductViewType type;

@end

@implementation ZXPinProductsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, self.frame.size.height)];
        self.bgImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.bgImageView.backgroundColor = kRandomColor;
        self.mainScrollView = [[ZXCycleBannerView alloc]initWithFrame:CGRectMake(0, 38.5, frame.size.width, frame.size.height - 38.5)];
        self.mainScrollView.delegate = self;
        self.mainScrollView.dataSource = self;
        self.mainScrollView.autoScroll = YES;
        self.mainScrollView.showPageControl = YES;
        self.mainScrollView.infiniteLoop = YES;
        self.mainScrollView.backgroundColor = kClearColor;
        [self addSubview:self.bgImageView];
        [self addSubview:self.mainScrollView];
    }
    return self;
}

+ (NSString *)cellIdentifier{
    return @"ZXPinProductsCellIDentifier";
}

+ (CGFloat)cellHeightWithType:(ZXPinProductViewType)type{
    switch (type) {
        case ZXPinProductViewTypeNormal:
            return 221.5;
            break;
        case ZXPinProductViewTypeLinePrice:
            return 221.5;
            break;
        case ZXPinProductViewTypePinCount:
            return 235.5;
            break;
            
        default:
            break;
    }
    return 0;
}

- (void)configCellWithProducts:(NSArray *)products type:(ZXPinProductViewType)type{
    self.productsArray = products;
    self.type = type;
    [self.mainScrollView reload];
}

#pragma mark - ZXCycleBannerViewDelegate

#pragma mark - ZXCycleBannerViewDataSource
- (NSInteger)numberOfItemsZXCycleBannerView:(ZXCycleBannerView *)bannerView{
    return self.productsArray.count/3;
}

- (UIView *)bannerView:(ZXCycleBannerView *)bannerView viewForItemAtIndex:(NSInteger)index{
    NSString *reuseId = [NSString stringWithFormat:@"ZXPinThreeProd%li", index];
    ZXPinThreeProductView *view = (ZXPinThreeProductView *)[bannerView dequeueReuseViewWithReuseIdentifier:reuseId forIndex:index];
    if (!view) {
        view = [[ZXPinThreeProductView alloc]initWithType:self.type];
        view.products = [self.productsArray subarrayWithRange:NSMakeRange(index * 3, 3)];
        view.delegate = self;
        view.reuseIdentifier = reuseId;
        view.frame = CGRectMake(0, 0, self.frame.size.width, [self.class cellHeightWithType:self.type] - 21 - 38.5);
    }
    return view;
}

#pragma mark - ZXPinProductViewDelegate
- (void)clickProdView:(ZXPinProductView *)prodView{
    if ([self.delegate respondsToSelector:@selector(clickProdView:)]) {
        [self.delegate clickProdView:prodView];
    }
    if ([self.delegate respondsToSelector:@selector(clickProdView:atIndex:)]) {
        NSInteger index = [self.productsArray indexOfObject:prodView.product];
        [self.delegate clickProdView:prodView atIndex:index];
    }
}

@end
