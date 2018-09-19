//
//  ZXCycleCollectionViewCell.m
//  ZXPageScrollView
//
//  Created by zhaoxu on 2017/3/28.
//  Copyright © 2017年 SUNING. All rights reserved.
//

#import "ZXCycleCollectionViewCell.h"

@interface ZXCycleCollectionViewCell()

@property (nonatomic, strong) UIImageView *mainImageView;

@end

@implementation ZXCycleCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setBannerItemView:(UIView *)bannerItemView{
    if (_bannerItemView == bannerItemView) {
        [self reAddBannerItemView];
        return;
    }
    if (bannerItemView) {
        [self.contentView addSubview:bannerItemView];
    }
    if (self.contentView.subviews.count > 1) {
        [_bannerItemView removeFromSuperview];
    }
    _bannerItemView = bannerItemView;
}

- (void)reAddBannerItemView{
    [self.contentView addSubview:self.bannerItemView];
}

@end
