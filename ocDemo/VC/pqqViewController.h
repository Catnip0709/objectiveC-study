//
//  pqqViewController.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import <UIKit/UIKit.h>

@class pqqViewModel;
@class pqqTopBtnView;
@class pqqActorView;
@class pqqMovieView;

@interface pqqViewController : UIViewController

@property(nonatomic, strong) pqqTopBtnView *pqqTopBtnView;
@property(nonatomic, strong) pqqMovieView *pqqMovieView;
@property(nonatomic, strong) pqqActorView *pqqActorView;

@property(nonatomic, strong) pqqViewModel *pqqViewModel;

@end

