//
//  ZXPageControl.h
//  TestZXCycleBannerView
//
//  Created by xu zhao on 2018/9/10.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXPageControl : UIView

@property (nonatomic, assign) NSInteger numberOfPages;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) BOOL hidesForSinglePage;

@property (nonatomic, assign) CGFloat horizontalSpace;

@property (nonatomic, copy) NSString *pageIndicatorImageName;

@property (nonatomic, copy) NSString *currentPageIndicatorImageName;

@property (nonatomic, assign) CGSize dotNormalSize;

@property (nonatomic, assign) CGSize dotSelectSize;

@end
