//
//  pqqTopBtnView.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "pqqTopBtnView.h"

@implementation pqqTopBtnView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self initView];
    [self pressEvent];
    
    [self addSubview: self.movieBtn];
    [self addSubview: self.mallBtn];
    [self addSubview: self.concertBtn];
    
    
    return self;
}

-(void) pressMovieBtn {
    self.movieBtn.backgroundColor = UIColor.redColor;
     [self.movieBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.mallBtn.backgroundColor = UIColor.whiteColor;
     [self.mallBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    self.concertBtn.backgroundColor = UIColor.whiteColor;
    [self.concertBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
}

-(void) pressMallBtn {
    self.movieBtn.backgroundColor = UIColor.whiteColor;
     [self.movieBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    self.mallBtn.backgroundColor = UIColor.redColor;
     [self.mallBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.concertBtn.backgroundColor = UIColor.whiteColor;
     [self.concertBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
}
-(void) pressConcertBtn {
    self.movieBtn.backgroundColor = UIColor.whiteColor;
     [self.movieBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    self.mallBtn.backgroundColor = UIColor.whiteColor;
     [self.mallBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    self.concertBtn.backgroundColor = UIColor.redColor;
     [self.concertBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
}

-(void) initView {
    self.movieBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.movieBtn.frame = CGRectMake(0.5 * self.frame.size.width - 120, 0, 80, 25);
    self.movieBtn.backgroundColor = UIColor.redColor;
    self.movieBtn.layer.masksToBounds = YES;
    self.movieBtn.layer.borderWidth = 1.0;
    self.movieBtn.layer.borderColor = [UIColor redColor].CGColor;
     [self.movieBtn setTitle: @"电影" forState: UIControlStateNormal];
     [self.movieBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    
    self.mallBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.mallBtn.frame = CGRectMake(0.5 * self.frame.size.width - 40, 0, 80, 25);
    self.mallBtn.backgroundColor = UIColor.whiteColor;
    self.mallBtn.layer.masksToBounds = YES;
    self.mallBtn.layer.borderWidth = 1.0;
    self.mallBtn.layer.borderColor = [UIColor redColor].CGColor;
     [self.mallBtn setTitle: @"商场" forState: UIControlStateNormal];
     [self.mallBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    
    self.concertBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self configbutton:_concertBtn title:@"演出"];
}

- (void)configbutton:(UIButton *)btn title:(NSString *)title
{
    btn.frame = CGRectMake(0.5 * self.frame.size.width + 40, 0, 80, 25);
    btn.backgroundColor = UIColor.whiteColor;
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = 1.0;
    btn.layer.borderColor = [UIColor redColor].CGColor;
    [btn setTitle: @"演出" forState: UIControlStateNormal];
    [btn setTitleColor:UIColor.redColor forState:UIControlStateNormal];

}

-(void)pressEvent {
     [self.movieBtn addTarget:self action:@selector(pressMovieBtn) forControlEvents:UIControlEventTouchUpInside];
     [self.mallBtn addTarget:self action:@selector(pressMallBtn) forControlEvents:UIControlEventTouchUpInside];
     [self.concertBtn addTarget:self action:@selector(pressConcertBtn) forControlEvents:UIControlEventTouchUpInside];
}

@end
