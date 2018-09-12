//
//  ZXCycleCollectionViewCell.h
//  ZXPageScrollView
//
//  Created by zhaoxu on 2017/3/28.
//  Copyright © 2017年 SUNING. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXCycleCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIView *bannerItemView;

- (void)reAddBannerItemView;

@end
