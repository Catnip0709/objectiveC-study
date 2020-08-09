//
//  PQQViewModel.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#ifndef PQQViewModel_h
#define PQQViewModel_h


#endif /* PQQViewModel_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PQQViewController;

typedef void(^FetchDataBlock)(NSArray *); // 回调函数定义

@interface PQQViewModel : NSObject
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, weak) PQQViewController *delegate;
- (void)fetchData:(FetchDataBlock)block;
@end

