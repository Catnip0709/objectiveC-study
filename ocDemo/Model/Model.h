//
//  MovieModel.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#ifndef MovieModel_h
#define MovieModel_h


#endif /* Model_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

struct ActorModel{
    NSString *name;
    NSString *subname;
    NSString *photo;
};

struct MovieModel {
    NSString *movieName;
    NSString *movieTime;
    NSString *moviePic;
    NSMutableArray *actorData;
};
