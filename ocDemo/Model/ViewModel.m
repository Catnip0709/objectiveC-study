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
    self.data = [[NSMutableArray alloc]init];
    
    NSMutableArray *movie1Actor = [[NSMutableArray alloc] init];
    
    ActorModel *actor1 = [[ActorModel alloc] init: @"易烊千玺" andSubName:@"1111" andPhoto:@"yyqx"];
    ActorModel *actor2 = [[ActorModel alloc] init: @"周冬雨" andSubName:@"2222" andPhoto:@"zdy"];
    [movie1Actor addObject: actor1];
    [movie1Actor addObject: actor2];
    [movie1Actor addObject: actor2];
    [movie1Actor addObject: actor2];
    MovieModel *movie1 = [[MovieModel alloc] init: @"少年的你" andMovieTime:@"2019-10-25" andMoviePic:@"sndn.jpg" andActorData: movie1Actor];
    
    NSMutableArray *movie2Actor = [[NSMutableArray alloc]init];
    ActorModel *actor3 = [[ActorModel alloc] init: @"施瓦辛格" andSubName:@"3333" andPhoto:@"swxg"];
    ActorModel *actor4 = [[ActorModel alloc] init: @"琳达" andSubName:@"4444" andPhoto:@"ld"];
    [movie1Actor addObject: actor3];
    [movie1Actor addObject: actor4];
    [movie1Actor addObject: actor4];
    [movie1Actor addObject: actor4];
    MovieModel *movie2 = [[MovieModel alloc] init: @"终结者" andMovieTime:@"2019-11-01" andMoviePic:@"zjz.jpg" andActorData: movie2Actor];

    [self.data addObject: movie1];
    [self.data addObject: movie1];
    [self.data addObject: movie2];
    [self.data addObject: movie2];
    
    self.myBlock = block;
    if (self.myBlock) {
        self.myBlock(self.data);
    }
}

@end

