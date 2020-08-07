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

- (id)init: (NSString *)name andSubName:(NSString *)subname andPhoto:(NSString *)photo {
    if (self = [super init]){
        self.name = name;
        self.subname = subname;
        self.photo = photo;
    }
    
    return self;
}
@end

@implementation PQQMovieModel

- (id)init: (NSString *)movieName andMovieTime:(NSString *)movieTime andMoviePic:(NSString *)moviePic andActorData: (NSArray *)actorData {
    if (self = [super init]){
        self.movieName = movieName;
        self.movieTime = movieTime;
        self.moviePic = moviePic;
        self.actorData = actorData;
    }
    return self;
}

@end

