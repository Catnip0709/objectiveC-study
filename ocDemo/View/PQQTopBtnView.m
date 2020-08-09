//
//  PQQTopBtnView.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "PQQTopBtnView.h"

#define TOP_BTN_BORDERWIDTH 1.0
#define MOVIE_BTN_RECT CGRectMake(0.5 * self.frame.size.width - 120, 0, 80, 25)
#define MALL_BTN_RECT CGRectMake(0.5 * self.frame.size.width - 40, 0, 80, 25)
#define CONCERT_BTN_RECT CGRectMake(0.5 * self.frame.size.width + 40, 0, 80, 25)

@interface PQQTopBtnView ()

@property (nonatomic, strong) UIButton *movieBtn;
@property (nonatomic, strong) UIButton *mallBtn;
@property (nonatomic, strong) UIButton *concertBtn;

@end

@implementation PQQTopBtnView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]){
        [self initView];
        [self p_pressEvent];
        [self addSubview: self.movieBtn];
        [self addSubview: self.mallBtn];
        [self addSubview: self.concertBtn];
    }
    
    return self;
}

- (void)p_pressMovieBtn {
    [self p_pressConfig:self.movieBtn otherBtn1:self.concertBtn otherBtn2:self.mallBtn];
}

- (void)p_pressMallBtn {
    [self p_pressConfig:self.mallBtn otherBtn1:self.movieBtn otherBtn2:self.concertBtn];
}

- (void)p_pressConcertBtn {
    [self p_pressConfig:self.concertBtn otherBtn1:self.movieBtn otherBtn2:self.mallBtn];
}

- (void)p_pressConfig:(UIButton *)selectedBtn otherBtn1:(UIButton *)otherBtn1 otherBtn2:(UIButton *)otherBtn2 {
    // 被选中的btn为红底白字
    selectedBtn.backgroundColor = UIColor.redColor;
     [selectedBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    // 未被选中的btn为白底红字
    otherBtn1.backgroundColor = UIColor.whiteColor;
    [otherBtn1 setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    otherBtn2.backgroundColor = UIColor.whiteColor;
    [otherBtn2 setTitleColor:UIColor.redColor forState:UIControlStateNormal];
}

- (void)initView {
    self.movieBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.mallBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.concertBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self p_configButton: self.movieBtn title:@"电影" frame:MOVIE_BTN_RECT];
    [self p_configButton: self.mallBtn title:@"商场" frame:MALL_BTN_RECT];
    [self p_configButton: self.concertBtn title:@"演出" frame:CONCERT_BTN_RECT];
    
    [self p_pressMovieBtn]; //设置初始界面在movie
}

- (void)p_configButton:(UIButton *)btn title:(NSString *)title frame:(CGRect)frame {
    btn.frame = frame;
    btn.backgroundColor = UIColor.whiteColor;
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = TOP_BTN_BORDERWIDTH;
    btn.layer.borderColor = [UIColor redColor].CGColor;
    [btn setTitle: title forState: UIControlStateNormal];
    [btn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
//    [btn setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
    
}

- (void)p_pressEvent {
     [self.movieBtn addTarget:self action:@selector(p_pressMovieBtn)forControlEvents:UIControlEventTouchUpInside];
     [self.mallBtn addTarget:self action:@selector(p_pressMallBtn)forControlEvents:UIControlEventTouchUpInside];
     [self.concertBtn addTarget:self action:@selector(p_pressConcertBtn)forControlEvents:UIControlEventTouchUpInside];
}

@end
