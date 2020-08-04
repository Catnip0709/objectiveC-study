//
//  TopBtnView.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "TopBtnView.h"

@implementation TopBtnView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self initView];
    [self pressEvent];
    
    [self addSubview: movieBtn];
    [self addSubview: mallBtn];
    [self addSubview: concertBtn];
    
    return self;
}

-(void) pressMovieBtn {
    movieBtn.backgroundColor = UIColor.redColor;
    [movieBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    mallBtn.backgroundColor = UIColor.whiteColor;
    [mallBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    concertBtn.backgroundColor = UIColor.whiteColor;
    [concertBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
}
-(void) pressMallBtn {
    movieBtn.backgroundColor = UIColor.whiteColor;
    [movieBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    mallBtn.backgroundColor = UIColor.redColor;
    [mallBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    concertBtn.backgroundColor = UIColor.whiteColor;
    [concertBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
}
-(void) pressConcertBtn {
    movieBtn.backgroundColor = UIColor.whiteColor;
    [movieBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    mallBtn.backgroundColor = UIColor.whiteColor;
    [mallBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    concertBtn.backgroundColor = UIColor.redColor;
    [concertBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
}

-(void) initView {
    movieBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    movieBtn.frame = CGRectMake(0.5 * self.frame.size.width - 120, 0, 80, 25);
    movieBtn.backgroundColor = UIColor.redColor;
    movieBtn.layer.masksToBounds = YES;
    movieBtn.layer.borderWidth = 1.0;
    movieBtn.layer.borderColor = [UIColor redColor].CGColor;
    [movieBtn setTitle: @"电影" forState: UIControlStateNormal];
    [movieBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    
    mallBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    mallBtn.frame = CGRectMake(0.5 * self.frame.size.width - 40, 0, 80, 25);
    mallBtn.backgroundColor = UIColor.whiteColor;
    mallBtn.layer.masksToBounds = YES;
    mallBtn.layer.borderWidth = 1.0;
    mallBtn.layer.borderColor = [UIColor redColor].CGColor;
    [mallBtn setTitle: @"商场" forState: UIControlStateNormal];
    [mallBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    
    concertBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    concertBtn.frame = CGRectMake(0.5 * self.frame.size.width + 40, 0, 80, 25);
    concertBtn.backgroundColor = UIColor.whiteColor;
    concertBtn.layer.masksToBounds = YES;
    concertBtn.layer.borderWidth = 1.0;
    concertBtn.layer.borderColor = [UIColor redColor].CGColor;
    [concertBtn setTitle: @"演出" forState: UIControlStateNormal];
    [concertBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
}

-(void)pressEvent {
    [movieBtn addTarget:self action:@selector(pressMovieBtn) forControlEvents:UIControlEventTouchUpInside];
    [mallBtn addTarget:self action:@selector(pressMallBtn) forControlEvents:UIControlEventTouchUpInside];
    [concertBtn addTarget:self action:@selector(pressConcertBtn) forControlEvents:UIControlEventTouchUpInside];
}

@end
