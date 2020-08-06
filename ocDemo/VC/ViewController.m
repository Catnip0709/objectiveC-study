//
//  ViewController.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "ViewController.h"
#import "TopBtnView.h"
#import "ActorView.h"
#import "ViewModel.h"
#import "MovieView.h"
#import "Model.h"

@implementation ViewController: UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topBtnView = [[TopBtnView alloc] initWithFrame:CGRectMake(0,50, self.view.frame.size.width,25)];
    self.movieView = [[MovieView alloc] initWithFrame: CGRectMake(0, self.topBtnView.frame.origin.y + self.topBtnView.frame.size.height + 20, self.view.frame.size.width, 300)];
    self.actorView = [[ActorView alloc] initWithFrame:CGRectMake(0,_movieView.frame.origin.y + self.movieView.frame.size.height, self.view.frame.size.width, 500)];
    
    self.viewModel = [[ViewModel alloc] init];
    
     NSThread *thread = [[NSThread alloc] initWithBlock:^{
        __weak typeof(self) weakSelf = self;
         [self.viewModel fetchData:^(NSArray *data) {
             if(data) {
                 weakSelf.movieView.movieData = data;
                 MovieModel *firstMovie = [data objectAtIndex: 0];
                 weakSelf.actorView.actorData = firstMovie.actorData;
             }
        }];
        // 实现MoiveView中的回调函数，当前movie改变时触发，使得ActorView的data改变
        self.movieView.selectedMovieCellHandler = ^(NSInteger index) {
            MovieModel *curMovie = [weakSelf.movieView.movieData objectAtIndex: index];
            weakSelf.actorView.actorData = curMovie.actorData;
        };
     }];
    [thread start];
    
    [self.view addSubview: self.topBtnView];
    [self.view addSubview: self.movieView];
    [self.view addSubview: self.actorView];
}
@end
