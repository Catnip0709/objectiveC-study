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

@implementation ViewController: UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _topBtnView = [[TopBtnView alloc]initWithFrame:CGRectMake(0,50, self.view.frame.size.width,25)];
    _actorView = [[ActorView alloc]initWithFrame:CGRectMake(0, _topBtnView.frame.origin.y + _topBtnView.frame.size.height + 50, self.view.frame.size.width, 500)];
    
    _viewModel = [[ViewModel alloc]init];
    [_viewModel fetchData:^(NSMutableArray *data) {
        self.actorView.actorData = data; // 可能发生强引用循环
        NSLog(@"1");
    }];
    
    [self.view addSubview: _topBtnView];
    [self.view addSubview: _actorView];
}
@end
