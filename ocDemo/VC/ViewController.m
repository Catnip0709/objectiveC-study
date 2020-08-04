//
//  ViewController.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController: UIViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    topBtnView = [[TopBtnView alloc]initWithFrame:CGRectMake(0,50, self.view.frame.size.width,25)];
    actorView = [[ActorView alloc]initWithFrame:CGRectMake(0, topBtnView.frame.origin.y + topBtnView.frame.size.height + 50, self.view.frame.size.width, 500)];
    
    [self.view addSubview: topBtnView];
    [self.view addSubview: actorView];
}
@end
