//
//  Model.m
//  ocDemo
//
//  Created by panqiaoqiao on 2020/8/6.
//  Copyright © 2020 catnip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PQQModel.h"

@implementation PQQActorModel

- (id)init: (NSString *)name subName:(NSString *)subname photo:(NSString *)photo {
    if (self = [super init]){
        self.name = name;
        self.subname = subname;
        self.photo = photo;
    }
    return self;
}
@end

@implementation PQQMovieModel

- (id)init: (NSString *)movieName movieTime:(NSString *)movieTime moviePic:(NSString *)moviePic actorData: (NSArray *)actorData {
    if (self = [super init]){
        self.movieName = movieName;
        self.movieTime = movieTime;
        self.moviePic = moviePic;
        self.actorData = actorData;
    }
    return self;
}

@end

