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
        return;
    }
    _bannerItemView = bannerItemView;
    if (bannerItemView) {
        [self.contentView addSubview:bannerItemView];
    }
}

@end