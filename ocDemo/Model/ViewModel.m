//
//  ViewModel.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "ViewModel.h"
#import "Model.h"
#import "ViewController.h"

@implementation ViewModel

-(void) fetchData:(fetchDataBlock) block{
    ActorModel *actor1 = [[ActorModel alloc] init: @"易烊千玺" andSubName:@"1111" andPhoto:@"yyqx"];
    ActorModel *actor2 = [[ActorModel alloc] init: @"周冬雨" andSubName:@"2222" andPhoto:@"zdy"];
    NSArray *movie1Actor = [NSArray arrayWithObjects: actor1, actor1, actor2, actor2, nil]; //nil表示数组赋值结束
    MovieModel *movie1 = [[MovieModel alloc] init: @"少年的你" andMovieTime:@"2019-10-25" andMoviePic:@"sndn.jpg" andActorData: movie1Actor];
    
    ActorModel *actor3 = [[ActorModel alloc] init: @"施瓦辛格" andSubName:@"3333" andPhoto:@"swxg"];
    ActorModel *actor4 = [[ActorModel alloc] init: @"琳达" andSubName:@"4444" andPhoto:@"ld"];
    NSArray *movie2Actor = [NSArray arrayWithObjects: actor3, actor4, actor3, actor4, nil]; //nil表示数组赋值结束
    MovieModel *movie2 = [[MovieModel alloc] init: @"终结者" andMovieTime:@"2019-11-01" andMoviePic:@"zjz.jpg" andActorData: movie2Actor];

    self.data = [NSArray arrayWithObjects: movie1, movie2, movie1, movie2, nil];
    
    self.myBlock = block;
    if (self.myBlock) {
        self.myBlock([self.data copy]);
    }
}

@end

