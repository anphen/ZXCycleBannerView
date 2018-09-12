//
//  ZXBrandPinProductsView.h
//  TestZXCycleBannerView
//
//  Created by xu zhao on 2018/9/12.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kRandomColor  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@class ZXBrandPinSingleProductView;
@protocol ZXBrandPinSingleProductViewDelegate <NSObject>

@optional
- (void)clickBrandProdView:(ZXBrandPinSingleProductView *)prodView;

- (void)clickBrandProdView:(ZXBrandPinSingleProductView *)prodView atIndex:(NSInteger)index;

- (void)clickBrandProdHandelButton:(ZXBrandPinSingleProductView *)prodView atIndex:(NSInteger)index;//暂不需要

@end

@interface ZXBrandPinSingleProductView : UIView

@property (nonatomic, strong) id product;

@end

@interface ZXBrandPinProductsView : UIView

@property (nonatomic, weak) id<ZXBrandPinSingleProductViewDelegate> delegate;

- (void)configCellWithProductArray:(NSArray *)products;

@end
