//
//  pqqViewController.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "pqqViewController.h"
#import "pqqTopBtnView.h"
#import "pqqActorView.h"
#import "pqqViewModel.h"
#import "pqqMovieView.h"
#import "pqqModel.h"

@implementation pqqViewController: UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pqqTopBtnView = [[pqqTopBtnView alloc] initWithFrame:CGRectMake(0,50, self.view.frame.size.width,25)];
    self.pqqMovieView = [[pqqMovieView alloc] initWithFrame: CGRectMake(0, self.pqqTopBtnView.frame.origin.y + self.pqqTopBtnView.frame.size.height + 20, self.view.frame.size.width, 300)];
    self.pqqActorView = [[pqqActorView alloc] initWithFrame:CGRectMake(0,_pqqMovieView.frame.origin.y + self.pqqMovieView.frame.size.height, self.view.frame.size.width, 500)];
    
    self.pqqViewModel = [[pqqViewModel alloc] init];
    
     NSThread *thread = [[NSThread alloc] initWithBlock:^{
        __weak typeof(self) weakSelf = self;
         [self.pqqViewModel fetchData:^(NSArray *data) {
             if(data) {
                 weakSelf.pqqMovieView.movieData = data;
                 pqqMovieModel *firstMovie = [data objectAtIndex: 0];
                 weakSelf.pqqActorView.actorData = firstMovie.actorData;
             }
        }];
        // 实现MoiveView中的回调函数，当前movie改变时触发，使得pqqActorView的data改变
        self.pqqMovieView.selectedMovieCellHandler = ^(NSInteger index) {
            pqqMovieModel *curMovie = [weakSelf.pqqMovieView.movieData objectAtIndex: index];
            weakSelf.pqqActorView.actorData = curMovie.actorData;
        };
     }];
    [thread start];
    
    [self.view addSubview: self.pqqTopBtnView];
    [self.view addSubview: self.pqqMovieView];
    [self.view addSubview: self.pqqActorView];
}
@end
