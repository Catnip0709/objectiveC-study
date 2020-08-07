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

#define ACTOR1_PHOTO_URL @"https://tvax4.sinaimg.cn/large/007JuAjBgy1ghia55yuf5j303y03y0t7.jpg"
#define ACTOR2_PHOTO_URL @"https://tvax4.sinaimg.cn/large/007JuAjBgy1ghibh5p5jnj30420423zf.jpg"
#define ACTOR3_PHOTO_URL @"https://tva3.sinaimg.cn/large/007JuAjBgy1ghibhjnjndj302r03n3ye.jpg"
#define ACTOR4_PHOTO_URL @"https://tvax2.sinaimg.cn/large/007JuAjBgy1ghibhy7nqhj302t03ldfq.jpg"
#define MOVIE1_PIC @"https://tvax3.sinaimg.cn/large/007JuAjBgy1ghibla48iwj30ew0ku40d.jpg"
#define MOVIE2_PIC @"https://tva1.sinaimg.cn/large/007JuAjBgy1ghiblu3au6j30dd0kuab7.jpg"

@implementation PQQViewModel

- (void)fetchData:(fetchDataBlock)block{
    PQQActorModel *actor1 = [[PQQActorModel alloc] init: @"易烊千玺" andSubName:@"1111" andPhoto:ACTOR1_PHOTO_URL];
    PQQActorModel *actor2 = [[PQQActorModel alloc] init: @"周冬雨" andSubName:@"2222" andPhoto:ACTOR2_PHOTO_URL];
    NSArray *movie1Actor = [NSArray arrayWithObjects: actor1, actor1, actor2, actor2, nil]; //nil表示数组赋值结束
    PQQMovieModel *movie1 = [[PQQMovieModel alloc] init: @"少年的你" andMovieTime:@"2019-10-25" andMoviePic:MOVIE1_PIC andActorData: movie1Actor];

    PQQActorModel *actor3 = [[PQQActorModel alloc] init: @"施瓦辛格" andSubName:@"3333" andPhoto:ACTOR3_PHOTO_URL];
    PQQActorModel *actor4 = [[PQQActorModel alloc] init: @"琳达" andSubName:@"4444" andPhoto:ACTOR4_PHOTO_URL];
    NSArray *movie2Actor = [NSArray arrayWithObjects: actor3, actor4, actor3, actor4, nil]; //nil表示数组赋值结束
    PQQMovieModel *movie2 = [[PQQMovieModel alloc] init: @"终结者" andMovieTime:@"2019-11-01" andMoviePic:MOVIE2_PIC andActorData: movie2Actor];

    self.data = [NSArray arrayWithObjects: movie1, movie2, movie1, movie2, nil];

    self.myBlock = block;
    if (self.myBlock){
        self.myBlock([self.data copy]);
    }
}

@end

