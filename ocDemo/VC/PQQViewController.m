//
//  PQQViewController.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "PQQViewController.h"
#import "PQQTopBtnView.h"
#import "PQQActorView.h"
#import "PQQViewModel.h"
#import "PQQMovieView.h"
#import "PQQModel.h"

#define TOP_BTN_VIEW_RECT CGRectMake(0,50, self.view.frame.size.width,25)
#define MOVIE_VIEW_RECT CGRectMake(0, self.PQQTopBtnView.frame.origin.y + self.PQQTopBtnView.frame.size.height + 20, self.view.frame.size.width, 300)
#define ACTOR_VIEW_RECT CGRectMake(0,_PQQMovieView.frame.origin.y + self.PQQMovieView.frame.size.height, self.view.frame.size.width, 500)

@interface PQQViewController ()
@property (nonatomic, strong) PQQTopBtnView *PQQTopBtnView;
@property (nonatomic, strong) PQQMovieView *PQQMovieView;
@property (nonatomic, strong) PQQActorView *PQQActorView;
@property (nonatomic, strong) PQQViewModel *PQQViewModel;
@end

@implementation PQQViewController: UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.PQQTopBtnView = [[PQQTopBtnView alloc] initWithFrame:TOP_BTN_VIEW_RECT];
    self.PQQMovieView = [[PQQMovieView alloc] initWithFrame:MOVIE_VIEW_RECT];
    self.PQQActorView = [[PQQActorView alloc] initWithFrame:ACTOR_VIEW_RECT];
    self.PQQViewModel = [[PQQViewModel alloc] init];
    
    [self.view addSubview: self.PQQTopBtnView];
    [self.view addSubview: self.PQQMovieView];
    [self.view addSubview: self.PQQActorView];
    
    //use gcd
    __weak typeof(self)weakSelf = self;
    [weakSelf.PQQViewModel fetchData:^(NSArray *data){
         dispatch_async(dispatch_get_main_queue(), ^{ // async异步，sync同步
             if (data){
                 weakSelf.PQQMovieView.movieData = data;
                 PQQMovieModel *firstMovie = [data objectAtIndex: 0];
                 weakSelf.PQQActorView.actorData = firstMovie.actorData;
             }
         });
    }];
        
    //实现MoiveView中的回调函数，当前movie改变时触发，使得PQQActorView的data改变
    weakSelf.PQQMovieView.selectedMovieCellHandler = ^(NSInteger index){
        dispatch_async(dispatch_get_main_queue(), ^{
            PQQMovieModel *curMovie = [weakSelf.PQQMovieView.movieData objectAtIndex: index];
            weakSelf.PQQActorView.actorData = curMovie.actorData;
        });
    };
}
@end
