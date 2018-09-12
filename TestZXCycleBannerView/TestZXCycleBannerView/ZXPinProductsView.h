//
//  ZXPinProductsCell.h
//  TestZXCycleBannerView
//
//  Created by xu zhao on 2018/9/11.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kRandomColor  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

#define kClearColor [UIColor clearColor]

typedef NS_ENUM(NSUInteger, ZXPinProductViewType) {
    ZXPinProductViewTypeNormal = 0,
    ZXPinProductViewTypeLinePrice,
    ZXPinProductViewTypePinCount,
};

@class ZXPinProductView;
@protocol ZXPinProductViewDelegate <NSObject>

@optional
- (void)clickProdView:(ZXPinProductView *)prodView;

- (void)clickProdView:(ZXPinProductView *)prodView atIndex:(NSInteger)index;

@end

@interface ZXPinProductView : UIView

@property (nonatomic, strong) id product;

@end

@interface ZXPinProductsView : UIView

@property (nonatomic, weak) id<ZXPinProductViewDelegate> delegate;

- (void)configCellWithProducts:(NSArray *)products type:(ZXPinProductViewType)type;

+ (NSString *)cellIdentifier;

+ (CGFloat)cellHeightWithType:(ZXPinProductViewType)type;

@end
