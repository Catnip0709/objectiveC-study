//
//  ViewController.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopBtnView.h"
#import "ActorView.h"
#import "ViewModel.h"

@interface ViewController : UIViewController {
    TopBtnView *topBtnView;
    ActorView *actorView;
    ViewModel *viewModel;
}


@end

