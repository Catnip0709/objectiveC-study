//
//  ViewModel.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#ifndef ViewModel_h
#define ViewModel_h


#endif /* ViewModel_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ViewController;

typedef void(^fetchDataBlock)(NSMutableArray*); // 回调函数定义

@interface ViewModel : NSObject
@property(nonatomic, strong) NSMutableArray *actorData;
@property(nonatomic, strong) ViewController *delegate;
@property(nonatomic, strong) fetchDataBlock myBlock;
-(void) fetchData: (fetchDataBlock)block;
@end

