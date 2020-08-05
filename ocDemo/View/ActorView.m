//
//  actorView.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "ActorView.h"
#import "Model.h"

#define ACTOR_TABLEVIEW_CELL @"ActorTableViewCell"

@implementation ActorTableViewCell
+ (CGFloat)cellHeight {
    return 200;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.photo = [[UIImageView alloc]initWithFrame:CGRectMake(20, 30, 140, 140)];
        self.photo.image = [UIImage imageNamed:@"yyqx.png"];
        [self addSubview:_photo];
        
        self.actorName = [[UILabel alloc]initWithFrame:CGRectMake(_photo.frame.origin.x + self.photo.frame.size.width + 50, 60, 100, 30)];
        [_actorName setText:@"姓名"];
        [_actorName setTextColor:UIColor.blackColor];
        self.actorName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_actorName];
        
        self.subName = [[UILabel alloc]initWithFrame:CGRectMake(_actorName.frame.origin.x, self.actorName.frame.origin.y + self.actorName.frame.size.height + 30, 100, 30)];
        [_subName setText:@"角色"];
        [_subName setTextColor:UIColor.grayColor];
        self.subName.textAlignment = NSTextAlignmentCenter;
        [self addSubview: self.subName];
    }
    return self;
}
@end

@interface ActorView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ActorView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.actorTableView = [[UITableView alloc]initWithFrame: self.bounds];
    self.actorTableView.dataSource = self;
    self.actorTableView.delegate = self;
    self.actorTableView.backgroundColor = UIColor.lightGrayColor;
    [self addSubview: self.actorTableView];
    
    return self;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ActorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: ACTOR_TABLEVIEW_CELL];
    cell = [[ActorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: ACTOR_TABLEVIEW_CELL];
    if (indexPath.row < [self.actorData count]) {
        struct ActorModel curActor;
        [[self.actorData objectAtIndex: indexPath.row] getValue:&curActor];
        cell.actorName.text = curActor.name;
        cell.subName.text = curActor.subname;
        [cell.photo setImage:[UIImage imageNamed:curActor.photo]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ActorTableViewCell cellHeight];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.actorData count];
}

//点击单元格触发的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"你点了一个cell");
}
@end


