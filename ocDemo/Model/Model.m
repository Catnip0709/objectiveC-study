//
//  Model.m
//  ocDemo
//
//  Created by panqiaoqiao on 2020/8/6.
//  Copyright © 2020 catnip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@implementation ActorModel

-(id) init: (NSString*) _name andSubName:(NSString*)_subname andPhoto:(NSString*) _photo {
    self.name = _name;
    self.subname = _subname;
    self.photo = _photo;
    return self;
}
@end

@implementation MovieModel

-(id) init: (NSString*) _movieName andMovieTime:(NSString*) _movieTime andMoviePic:(NSString*) _moviePic andActorData: (NSArray*) _actorData {
    self.movieName = _movieName;
    self.movieTime = _movieTime;
    self.moviePic = _moviePic;
    self.actorData = _actorData;
    return self;
}

@end

