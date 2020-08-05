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
    
    NSMutableArray *movie1Actor = [[NSMutableArray alloc]init];
    struct ActorModel actor1 = {@"易烊千玺", @"1111", @"yyqx"};
    struct ActorModel actor2 = {@"周冬雨", @"2222", @"zdy"};
    [movie1Actor addObject:[NSValue value:&actor1 withObjCType:@encode(struct ActorModel)]];
    [movie1Actor addObject:[NSValue value:&actor2 withObjCType:@encode(struct ActorModel)]];
    [movie1Actor addObject:[NSValue value:&actor2 withObjCType:@encode(struct ActorModel)]];
    [movie1Actor addObject:[NSValue value:&actor2 withObjCType:@encode(struct ActorModel)]];
    struct MovieModel movie1 = {@"少年的你", @"2019-10-25", @"sndn.jpg", movie1Actor};
    
    NSMutableArray *movie2Actor = [[NSMutableArray alloc]init];
    struct ActorModel actor3 = {@"施瓦辛格", @"T-80", @"swxg"};
    struct ActorModel actor4 = {@"琳达", @"Sara", @"ld"};
    [movie2Actor addObject:[NSValue value:&actor3 withObjCType:@encode(struct ActorModel)]];
    [movie2Actor addObject:[NSValue value:&actor4 withObjCType:@encode(struct ActorModel)]];
    [movie2Actor addObject:[NSValue value:&actor4 withObjCType:@encode(struct ActorModel)]];
    [movie2Actor addObject:[NSValue value:&actor4 withObjCType:@encode(struct ActorModel)]];
    struct MovieModel movie2 = {@"终结者", @"2019-11-01", @"zjz.jpg", movie2Actor};

    [self.data addObject:[NSValue value:&movie1 withObjCType:@encode(struct MovieModel)]];
    [self.data addObject:[NSValue value:&movie2 withObjCType:@encode(struct MovieModel)]];
    [self.data addObject:[NSValue value:&movie1 withObjCType:@encode(struct MovieModel)]];
    [self.data addObject:[NSValue value:&movie1 withObjCType:@encode(struct MovieModel)]];
    
    self.myBlock = block;
    if (self.myBlock) {
        self.myBlock(self.data);
    }
}

@end

