//
//  ZXCycleBannerView.h
//  ZXPageScrollView
//
//  Created by zhaoxu on 2017/3/30.
//  Copyright © 2017年 SUNING. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(_ZXCycleBannerReuseIdentifier)

@property (nonatomic, copy) NSString *reuseIdentifier;//复用标识

@end

@class ZXCycleBannerView;
@protocol ZXCycleBannerViewDelegate <NSObject>

@end

@protocol ZXCycleBannerViewDataSource <NSObject>

@optional
- (NSInteger)numberOfItemsZXCycleBannerView:(ZXCycleBannerView *)bannerView;

- (UIView *)bannerView:(ZXCycleBannerView *)bannerView
    viewForItemAtIndex:(NSInteger)index;

@end

@interface ZXCycleBannerView : UIView

@property (nonatomic, assign) NSTimeInterval autoScrollTimeInterval;
@property (nonatomic, assign) BOOL autoScroll;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, copy) void(^monitorIndex)(NSInteger currentIndex);

@property (nonatomic, assign) BOOL showPageControl;

@property (nonatomic,assign) BOOL infiniteLoop;

@property (nonatomic, weak) id<ZXCycleBannerViewDelegate> delegate;
@property (nonatomic, weak) id<ZXCycleBannerViewDataSource> dataSource;

- (UIView *)dequeueReuseViewWithReuseIdentifier:(NSString *)identifier forIndex:(NSInteger)index;

- (void)reload;

@end
