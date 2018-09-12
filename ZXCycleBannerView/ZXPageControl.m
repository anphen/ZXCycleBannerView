//
//  ZXPageControl.m
//  TestZXCycleBannerView
//
//  Created by xu zhao on 2018/9/10.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "ZXPageControl.h"
#import "Masonry.h"

@interface DotImageControl : UIImageView

@property (nonatomic, assign) BOOL select;
@property (nonatomic, copy) NSString * normalImage;
@property (nonatomic, copy) NSString * selectImage;
@property (nonatomic, strong) MASConstraint *widthConstraint;
@property (nonatomic, strong) MASConstraint *hegihtConstraint;

- (instancetype)initWithNormalImage:(NSString *)normalImage selectImage:(NSString *)selectImage;

@end

@implementation DotImageControl
- (instancetype)initWithNormalImage:(NSString *)normalImage selectImage:(NSString *)selectImage
{
    self = [super init];
    if (self) {
        _select = NO;
        _normalImage = normalImage;
        _selectImage = selectImage;
        self.image = [UIImage imageNamed:_normalImage];
    }
    return self;
}

- (void)setSelect:(BOOL)select{
    if (_select == select) {
        return;
    }
    _select = select;
    if (select) {
        self.image = [UIImage imageNamed:self.selectImage];
    }
    else{
        self.image = [UIImage imageNamed:self.normalImage];
    }
}

@end

@interface ZXPageControl()

@property (nonatomic, strong) NSMutableArray *dotArray;

@property (nonatomic, strong) UIView *dotContentView;

@end

@implementation ZXPageControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
        self.contentMode = UIViewContentModeScaleAspectFit;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)initialization{
    _numberOfPages = 0;
    _currentPage = NSIntegerMax;
    _hidesForSinglePage = YES;
    _horizontalSpace = 2.f;
    _pageIndicatorImageName = @"pagecontrol_dot_normal";
    _currentPageIndicatorImageName = @"pagecontrol_dot_select";
    _dotArray = [[NSMutableArray alloc]init];
    _dotContentView = [[UIView alloc]init];
    _dotNormalSize = CGSizeMake(4.5, 3);
    _dotSelectSize = CGSizeMake(8, 3);
}

- (void)setNumberOfPages:(NSInteger)numberOfPages{
    _numberOfPages = numberOfPages;
    [self.dotArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.dotArray = [NSMutableArray array];
    [self.dotContentView removeFromSuperview];
    if (numberOfPages > 1) {
        [self setUpUI];
    }
}

- (void)setUpUI{
    if (self.numberOfPages > 1) {
        [self addSubview:self.dotContentView];
        [self.dotContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
        DotImageControl *lastDot = nil;
        for (int i = 0; i< _numberOfPages; i++) {
            DotImageControl *dot = [[DotImageControl alloc]initWithNormalImage:self.pageIndicatorImageName selectImage:self.currentPageIndicatorImageName];
            [self.dotArray addObject:dot];
            [self.dotContentView addSubview:dot];
            [dot mas_makeConstraints:^(MASConstraintMaker *make) {
                dot.hegihtConstraint = make.height.mas_equalTo(self.dotNormalSize.height);
                dot.widthConstraint = make.width.mas_equalTo(self.dotNormalSize.width);
                make.centerY.mas_equalTo(self.dotContentView.mas_centerY);
                if (i == 0) {
                    make.left.mas_equalTo(self.dotContentView.mas_left);
                }
                else if (i == self.numberOfPages - 1) {
                    make.left.mas_equalTo(lastDot.mas_right).offset(self.horizontalSpace);
                    make.right.mas_equalTo(self.dotContentView.mas_right);
                }
                else{
                    make.left.mas_equalTo(lastDot.mas_right).offset(self.horizontalSpace);
                }
            }];
            lastDot = dot;
        }
        self.currentPage = 0;
    }
}

- (void)setCurrentPage:(NSInteger)currentPage{
    if (_currentPage == NSIntegerMax) {
        //初始设置
        DotImageControl *currentImagedot = [self.dotArray objectAtIndex:0];
        currentImagedot.select = YES;
        _currentPage = 0;
        currentImagedot.widthConstraint.mas_equalTo(self.dotSelectSize.width);
        currentImagedot.hegihtConstraint.mas_equalTo(self.dotSelectSize.height);
        [self.dotContentView layoutIfNeeded];
        return;
    }
    if (_currentPage == currentPage || currentPage < 0 || currentPage >= self.numberOfPages) {
        return;
    }
    
    DotImageControl *currentImagedot = [self.dotArray objectAtIndex:_currentPage];
    currentImagedot.select = NO;
    currentImagedot.widthConstraint.mas_equalTo(self.dotNormalSize.width);
    currentImagedot.hegihtConstraint.mas_equalTo(self.dotNormalSize.height);
    
    DotImageControl *selectImagedot = [self.dotArray objectAtIndex:currentPage];
    selectImagedot.select = YES;
    selectImagedot.widthConstraint.mas_equalTo(self.dotSelectSize.width);
    selectImagedot.hegihtConstraint.mas_equalTo(self.dotSelectSize.height);
    
    [self.dotContentView layoutIfNeeded];
    _currentPage = currentPage;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGPoint coverPoint =  [self.dotContentView convertPoint:point fromView:self];
    if ([self.dotContentView pointInside:coverPoint withEvent:event]) {
        return YES;
    }
    return NO;
}

@end
