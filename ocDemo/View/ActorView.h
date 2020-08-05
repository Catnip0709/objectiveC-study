//
//  actorView.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#ifndef actorView_h
#define actorView_h


#endif /* actorView_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ActorTableViewCell: UITableViewCell
@property(nonatomic, strong) UILabel *actorName;
@property(nonatomic, strong) UILabel *subName;
@property(nonatomic, strong) UIImageView *photo;
@end

@interface ActorView : UIView
@property(nonatomic, strong) UITableView *actorTableView;
@property(nonatomic, strong) NSMutableArray *actorData;
@end

