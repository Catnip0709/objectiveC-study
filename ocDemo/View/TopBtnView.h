//
//  TopBtnView.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#ifndef TopBtnView_h
#define TopBtnView_h

#endif /* TopBtnView_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TopBtnView : UIView
@property(nonatomic ,strong) UIButton *movieBtn;
@property(nonatomic ,strong) UIButton *mallBtn;
@property(nonatomic ,strong) UIButton *concertBtn;
-(void) pressMallBtn;
-(void) pressEvent;
-(void) initView;
@end
