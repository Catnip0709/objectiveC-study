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
    
    [self addSubview: _movieBtn];
    [self addSubview: _mallBtn];
    [self addSubview: _concertBtn];
    
    return self;
}

-(void) pressMovieBtn {
    _movieBtn.backgroundColor = UIColor.redColor;
    [_movieBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    _mallBtn.backgroundColor = UIColor.whiteColor;
    [_mallBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    _concertBtn.backgroundColor = UIColor.whiteColor;
    [_concertBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
}
-(void) pressMallBtn {
    _movieBtn.backgroundColor = UIColor.whiteColor;
    [_movieBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    _mallBtn.backgroundColor = UIColor.redColor;
    [_mallBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    _concertBtn.backgroundColor = UIColor.whiteColor;
    [_concertBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
}
-(void) pressConcertBtn {
    _movieBtn.backgroundColor = UIColor.whiteColor;
    [_movieBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    _mallBtn.backgroundColor = UIColor.whiteColor;
    [_mallBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    _concertBtn.backgroundColor = UIColor.redColor;
    [_concertBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
}

-(void) initView {
    _movieBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _movieBtn.frame = CGRectMake(0.5 * self.frame.size.width - 120, 0, 80, 25);
    _movieBtn.backgroundColor = UIColor.redColor;
    _movieBtn.layer.masksToBounds = YES;
    _movieBtn.layer.borderWidth = 1.0;
    _movieBtn.layer.borderColor = [UIColor redColor].CGColor;
    [_movieBtn setTitle: @"电影" forState: UIControlStateNormal];
    [_movieBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    
    _mallBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _mallBtn.frame = CGRectMake(0.5 * self.frame.size.width - 40, 0, 80, 25);
    _mallBtn.backgroundColor = UIColor.whiteColor;
    _mallBtn.layer.masksToBounds = YES;
    _mallBtn.layer.borderWidth = 1.0;
    _mallBtn.layer.borderColor = [UIColor redColor].CGColor;
    [_mallBtn setTitle: @"商场" forState: UIControlStateNormal];
    [_mallBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    
    _concertBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _concertBtn.frame = CGRectMake(0.5 * self.frame.size.width + 40, 0, 80, 25);
    _concertBtn.backgroundColor = UIColor.whiteColor;
    _concertBtn.layer.masksToBounds = YES;
    _concertBtn.layer.borderWidth = 1.0;
    _concertBtn.layer.borderColor = [UIColor redColor].CGColor;
    [_concertBtn setTitle: @"演出" forState: UIControlStateNormal];
    [_concertBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
}

-(void)pressEvent {
    [_movieBtn addTarget:self action:@selector(pressMovieBtn) forControlEvents:UIControlEventTouchUpInside];
    [_mallBtn addTarget:self action:@selector(pressMallBtn) forControlEvents:UIControlEventTouchUpInside];
    [_concertBtn addTarget:self action:@selector(pressConcertBtn) forControlEvents:UIControlEventTouchUpInside];
}

@end
