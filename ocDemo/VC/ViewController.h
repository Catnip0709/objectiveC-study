//
//  ViewController.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewModel;
@class TopBtnView;
@class ActorView;
@class MovieView;

@interface ViewController : UIViewController

@property(nonatomic, strong) TopBtnView *topBtnView;
@property(nonatomic, strong) MovieView *movieView;
@property(nonatomic, strong) ActorView *actorView;

@property(nonatomic, strong) ViewModel *viewModel;

@end

