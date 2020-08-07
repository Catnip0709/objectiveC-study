//
//  PQQViewModel.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "PQQViewModel.h"
#import "PQQModel.h"
#import "PQQViewController.h"
#import <AFNetworking.h>
#import <SDWebImage.h>

@implementation PQQViewModel

#define SERVER_IP @"http://192.168.64.2/"

- (void)fetchData:(fetchDataBlock)block{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    [manager GET:SERVER_IP parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //太多hardcode，但由于是NSArray，暂时没想到好办法
        
        PQQActorModel *actor1 = [[PQQActorModel alloc] init: responseObject[0][@"actorData"][0][@"name"] andSubName:responseObject[0][@"actorData"][0][@"subname"] andPhoto:responseObject[0][@"actorData"][0][@"photo"]];
        PQQActorModel *actor2 = [[PQQActorModel alloc] init: responseObject[0][@"actorData"][1][@"name"] andSubName:responseObject[0][@"actorData"][1][@"subname"] andPhoto:responseObject[0][@"actorData"][1][@"photo"]];
        NSArray *movie1Actor = [NSArray arrayWithObjects: actor1, actor1, actor2, actor2, nil];
        PQQMovieModel *movie1 = [[PQQMovieModel alloc] init: responseObject[0][@"movieName"] andMovieTime:responseObject[0][@"movieTime"] andMoviePic:responseObject[0][@"moviePic"] andActorData: movie1Actor];
        
        PQQActorModel *actor3 = [[PQQActorModel alloc] init: responseObject[1][@"actorData"][0][@"name"] andSubName:responseObject[1][@"actorData"][0][@"subname"] andPhoto:responseObject[1][@"actorData"][0][@"photo"]];
        PQQActorModel *actor4 = [[PQQActorModel alloc] init: responseObject[1][@"actorData"][1][@"name"] andSubName:responseObject[1][@"actorData"][1][@"subname"] andPhoto:responseObject[1][@"actorData"][1][@"photo"]];
        NSArray *movie2Actor = [NSArray arrayWithObjects: actor3, actor4, actor3, actor4, nil];
        PQQMovieModel *movie2 = [[PQQMovieModel alloc] init: responseObject[1][@"movieName"] andMovieTime:responseObject[1][@"movieTime"] andMoviePic:responseObject[1][@"moviePic"] andActorData: movie2Actor];
        
        self.data = [NSArray arrayWithObjects: movie1, movie2, movie1, movie2, nil];
        self.myBlock = block;
        if (self.myBlock){
            self.myBlock([self.data copy]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"network err");
    }];
}

@end

