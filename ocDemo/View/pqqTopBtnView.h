//
//  pqqTopBtnView.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#ifndef pqqTopBtnView_h
#define pqqTopBtnView_h

#endif /* pqqTopBtnView_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface pqqTopBtnView : UIView
@property(nonatomic, strong) UIButton *movieBtn;
@property(nonatomic, strong) UIButton *mallBtn;
@property(atomic, strong) UIButton *concertBtn;
-(void) pressMallBtn;
-(void) pressEvent;
-(void) initView;
@end
