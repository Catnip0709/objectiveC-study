//
//  PQQTopBtnView.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#ifndef PQQTopBtnView_h
#define PQQTopBtnView_h

#endif /* PQQTopBtnView_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PQQTopBtnView : UIView
- (void)pressMallBtn;
- (void)pressEvent;
- (void)initView;
- (void)configButton:(UIButton *)btn title:(NSString *)title frame:(CGRect)frame;
- (void)pressConfig:(UIButton *)selectedBtn otherBtn1:(UIButton *)otherBtn1 otherBtn2:(UIButton *)otherBtn2;
@end
