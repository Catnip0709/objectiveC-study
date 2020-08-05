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
    _actorData = [[NSMutableArray alloc]init];
    struct ActorModel actor1 = {@"易烊千玺", @"1111", @"yyqx"};
    struct ActorModel actor2 = {@"周冬雨", @"2222", @"zdy"};
    [_actorData addObject:[NSValue value:&actor1 withObjCType:@encode(struct ActorModel)]];
    [_actorData addObject:[NSValue value:&actor2 withObjCType:@encode(struct ActorModel)]];
    [_actorData addObject:[NSValue value:&actor2 withObjCType:@encode(struct ActorModel)]];
    [_actorData addObject:[NSValue value:&actor2 withObjCType:@encode(struct ActorModel)]];
    
    self.myBlock = block;
    if (self.myBlock) {
        self.myBlock(_actorData);
    }
}

@end

