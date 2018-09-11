//
//  NSObject+ZXForKVO.h
//  TestZXCycleBannerView
//
//  Created by xu zhao on 2018/9/11.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZXForKVO)

- (void)ZXAddObserverBlockForKeyPath:(NSString*)keyPath block:(void (^)(id _Nonnull obj, _Nullable id oldVal, _Nullable id newVal))block;

- (void)ZXZXRemoveObserverBlocksForKeyPath:(NSString*)keyPath;

- (void)ZXRemoveObserverBlocks;

@end
