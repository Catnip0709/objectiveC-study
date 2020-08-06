//
//  pqqActorView.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "pqqActorView.h"
#import "pqqModel.h"

#define ACTOR_TABLEVIEW_CELL @"pqqActorTableViewCell"

@implementation pqqActorTableViewCell
+ (CGFloat)cellHeight {
    return 200;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.photo = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 140, 140)];
        self.photo.image = [UIImage imageNamed:@"yyqx.png"];
        [self addSubview:_photo];
        
        self.actorName = [[UILabel alloc] initWithFrame:CGRectMake(_photo.frame.origin.x + self.photo.frame.size.width + 50, 60, 100, 30)];
        [_actorName setText:@"姓名"];
        [_actorName setTextColor:UIColor.blackColor];
        self.actorName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_actorName];
        
        self.subName = [[UILabel alloc] initWithFrame:CGRectMake(_actorName.frame.origin.x, self.actorName.frame.origin.y + self.actorName.frame.size.height + 30, 100, 30)];
        [_subName setText:@"角色"];
        [_subName setTextColor:UIColor.grayColor];
        self.subName.textAlignment = NSTextAlignmentCenter;
        [self addSubview: self.subName];
    }
    return self;
}
@end

@interface pqqActorView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation pqqActorView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.actorTableView = [[UITableView alloc] initWithFrame: self.bounds];
    self.actorTableView.dataSource = self;
    self.actorTableView.delegate = self;
    self.actorTableView.backgroundColor = UIColor.lightGrayColor;
    [self addSubview: self.actorTableView];
    
    return self;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    pqqActorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: ACTOR_TABLEVIEW_CELL];
    cell = [[pqqActorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: ACTOR_TABLEVIEW_CELL];
    if (indexPath.row < [self.actorData count]) {
        pqqActorModel *curActor = [self.actorData objectAtIndex: indexPath.row];
        cell.actorName.text = curActor.name;
        cell.subName.text = curActor.subname;
        [cell.photo setImage:[UIImage imageNamed:curActor.photo]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [pqqActorTableViewCell cellHeight];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.actorData count];
}

//点击单元格触发的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"你点了一个cell");
}

// set方法默认写法
// self.和_的区别：使用self.a会调用getter/setter方法，而_a并不会调用getter/setter方法,它是直接访问实例变量并赋值。
// 如果这里使用self.actorData，则不断循环调用set方法导致crush
-(void)setActorData:(NSArray *)actorData {
    if (_actorData != actorData) {
        _actorData = actorData;
    }
    if ([NSThread isMainThread]) {
        [self.actorTableView reloadData];
    }
}
@end


