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

#define SERVER_IP @"http://192.168.64.2/"

@implementation PQQViewModel


- (void)fetchData:(FetchDataBlock)block{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    [manager GET:SERVER_IP parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //太多hardcode，但由于是NSArray，暂时没想到好办法
        
        PQQActorModel *actor1 = [[PQQActorModel alloc] init: responseObject[0][@"actorData"][0][@"name"] subName:responseObject[0][@"actorData"][0][@"subname"] photo:responseObject[0][@"actorData"][0][@"photo"]];
        PQQActorModel *actor2 = [[PQQActorModel alloc] init: responseObject[0][@"actorData"][1][@"name"] subName:responseObject[0][@"actorData"][1][@"subname"] photo:responseObject[0][@"actorData"][1][@"photo"]];
        NSArray *movie1actor = [NSArray arrayWithObjects: actor1, actor1, actor2, actor2, nil];
        PQQMovieModel *movie1 = [[PQQMovieModel alloc] init: responseObject[0][@"movieName"] movieTime:responseObject[0][@"movieTime"] moviePic:responseObject[0][@"moviePic"] actorData: movie1actor];
        
        PQQActorModel *actor3 = [[PQQActorModel alloc] init: responseObject[1][@"actorData"][0][@"name"] subName:responseObject[1][@"actorData"][0][@"subname"] photo:responseObject[1][@"actorData"][0][@"photo"]];
        PQQActorModel *actor4 = [[PQQActorModel alloc] init: responseObject[1][@"actorData"][1][@"name"] subName:responseObject[1][@"actorData"][1][@"subname"] photo:responseObject[1][@"actorData"][1][@"photo"]];
        NSArray *movie2actor = [NSArray arrayWithObjects: actor3, actor4, actor3, actor4, nil];
        PQQMovieModel *movie2 = [[PQQMovieModel alloc] init: responseObject[1][@"movieName"] movieTime:responseObject[1][@"movieTime"] moviePic:responseObject[1][@"moviePic"] actorData: movie2actor];
        
        self.data = [NSArray arrayWithObjects: movie1, movie2, movie1, movie2, nil];
        if (block){
            block([self.data copy]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"network err");
    }];
}

@end

