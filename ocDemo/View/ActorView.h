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
#import "Model.h"

@interface ActorTableViewCell: UITableViewCell {
    UILabel *actorName;
    UILabel *subName;
    UIImageView *photo;
    NSMutableArray *actorData;
}
@end

@interface ActorView : UIView {
    UITableView *actorTableView;
}
@end

