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

@implementation PQQViewModel

- (void)fetchData:(fetchDataBlock)block{
    PQQActorModel *actor1 = [[PQQActorModel alloc] init: @"易烊千玺" andSubName:@"1111" andPhoto:@"yyqx"];
    PQQActorModel *actor2 = [[PQQActorModel alloc] init: @"周冬雨" andSubName:@"2222" andPhoto:@"zdy"];
    NSArray *movie1Actor = [NSArray arrayWithObjects: actor1, actor1, actor2, actor2, nil]; //nil表示数组赋值结束
    PQQMovieModel *movie1 = [[PQQMovieModel alloc] init: @"少年的你" andMovieTime:@"2019-10-25" andMoviePic:@"sndn.jpg" andActorData: movie1Actor];
    
    PQQActorModel *actor3 = [[PQQActorModel alloc] init: @"施瓦辛格" andSubName:@"3333" andPhoto:@"swxg"];
    PQQActorModel *actor4 = [[PQQActorModel alloc] init: @"琳达" andSubName:@"4444" andPhoto:@"ld"];
    NSArray *movie2Actor = [NSArray arrayWithObjects: actor3, actor4, actor3, actor4, nil]; //nil表示数组赋值结束
    PQQMovieModel *movie2 = [[PQQMovieModel alloc] init: @"终结者" andMovieTime:@"2019-11-01" andMoviePic:@"zjz.jpg" andActorData: movie2Actor];

    self.data = [NSArray arrayWithObjects: movie1, movie2, movie1, movie2, nil];
    
    self.myBlock = block;
    if (self.myBlock){
        self.myBlock([self.data copy]);
    }
}

@end

