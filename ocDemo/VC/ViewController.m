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
    
    self.topBtnView = [[TopBtnView alloc]initWithFrame:CGRectMake(0,50, self.view.frame.size.width,25)];
    self.movieView = [[MovieView alloc]initWithFrame: CGRectMake(0, self.topBtnView.frame.origin.y + self.topBtnView.frame.size.height + 20, self.view.frame.size.width, 300)];
    self.actorView = [[ActorView alloc]initWithFrame:CGRectMake(0,_movieView.frame.origin.y + self.movieView.frame.size.height + 20, self.view.frame.size.width, 500)];
    
    self.viewModel = [[ViewModel alloc]init];
     [self.viewModel fetchData:^(NSMutableArray *data) {
         if(data) {
             self.movieView.movieData = data;
             MovieModel *firstMovie = [data objectAtIndex: 0];
             self.actorView.actorData = firstMovie.actorData;
             [self.movieView.movieCollectionView reloadData];
             [self.actorView.actorTableView reloadData];
             NSLog(@"123");
         }
    }];
    
    [self.view addSubview: self.topBtnView];
    [self.view addSubview: self.movieView];
    [self.view addSubview: self.actorView];
}
@end
