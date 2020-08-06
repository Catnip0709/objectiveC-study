//
//  pqqViewModel.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#ifndef pqqViewModel_h
#define pqqViewModel_h


#endif /* pqqViewModel_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class pqqViewController;

typedef void(^fetchDataBlock)(NSArray*); // 回调函数定义

@interface pqqViewModel : NSObject
@property(nonatomic, strong) NSArray *data;
@property(nonatomic, strong) pqqViewController *delegate;
@property(nonatomic, strong) fetchDataBlock myBlock;
-(void) fetchData: (fetchDataBlock)block;
@end

