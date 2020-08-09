//
//  PQQMovieModel.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#ifndef PQQMovieModel_h
#define PQQMovieModel_h


#endif /* Model_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PQQActorModel : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *subname;
@property (nonatomic, strong) NSString *photo;
- (id)init:(NSString *)name subName:(NSString *)subname photo:(NSString *)photo;
@end

@interface PQQMovieModel: NSObject
@property (nonatomic, strong) NSString *movieName;
@property (nonatomic, strong) NSString *movieTime;
@property (nonatomic, strong) NSString *moviePic;
@property (nonatomic, strong) NSArray *actorData;
- (id)init:(NSString *)movieName movieTime:(NSString *)movieTime moviePic:(NSString *)andMoviePic actorData: (NSArray *)actorData;
@end
