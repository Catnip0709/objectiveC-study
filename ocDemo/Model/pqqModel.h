//
//  pqqMovieModel.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#ifndef pqqMovieModel_h
#define pqqMovieModel_h


#endif /* Model_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface pqqActorModel: NSObject
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *subname;
@property(nonatomic, strong) NSString *photo;
-(id) init: (NSString*) _name andSubName:(NSString*)_subname andPhoto:(NSString*) _photo;
@end

@interface pqqMovieModel: NSObject
@property(nonatomic, strong) NSString *movieName;
@property(nonatomic, strong) NSString *movieTime;
@property(nonatomic, strong) NSString *moviePic;
@property(nonatomic, strong) NSArray *actorData;
-(id) init: (NSString*) _movieName andMovieTime:(NSString*) _movieTime andMoviePic:(NSString*) andMoviePic andActorData: (NSArray*) _actorData;
@end
