//
//  PQQActorView.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "PQQActorView.h"
#import "PQQModel.h"
#import <SDWebImage.h>

#define ACTOR_TABLEVIEW_CELL @"PQQActorTableViewCell"
#define CELL_HEIGHT 200
#define ACTOR_PHOTO_RECT CGRectMake(20, 30, 140, 140)
#define ACTOR_NAME_RECT CGRectMake(_photo.frame.origin.x + self.photo.frame.size.width + 50, 60, 100, 30)
#define ACTOR_SUBNAME_RECT CGRectMake(_actorName.frame.origin.x, self.actorName.frame.origin.y + self.actorName.frame.size.height + 30, 100, 30)
#define ACTOR_DEFAULT_PHOTO @"yyqx.png"
#define ACTOR_DEFAULT_NAME @"姓名"
#define ACTOR_DEFAULT_SUBNAME @"角色"

@implementation PQQActorTableViewCell
+ (CGFloat)cellHeight {
    return CELL_HEIGHT;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.photo = [[UIImageView alloc] initWithFrame:ACTOR_PHOTO_RECT];
        self.photo.image = [UIImage imageNamed:ACTOR_DEFAULT_PHOTO];
        [self addSubview:_photo];
        
        self.actorName = [[UILabel alloc] initWithFrame:ACTOR_NAME_RECT];
        [_actorName setText:ACTOR_DEFAULT_NAME];
        [_actorName setTextColor:UIColor.blackColor];
        self.actorName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_actorName];
        
        self.subName = [[UILabel alloc] initWithFrame:ACTOR_SUBNAME_RECT];
        [_subName setText:ACTOR_DEFAULT_SUBNAME];
        [_subName setTextColor:UIColor.grayColor];
        self.subName.textAlignment = NSTextAlignmentCenter;
        [self addSubview: self.subName];
    }
    return self;
}
@end

@interface PQQActorView ()
@property (nonatomic, strong) UITableView *actorTableView;
@end

@interface PQQActorView ()<UITableViewDelegate, UITableViewDataSource>
@end

@implementation PQQActorView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.actorTableView = [[UITableView alloc] initWithFrame: self.bounds];
    self.actorTableView.dataSource = self;
    self.actorTableView.delegate = self;
    self.actorTableView.backgroundColor = UIColor.lightGrayColor;
    [self addSubview: self.actorTableView];
    
    return self;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PQQActorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: ACTOR_TABLEVIEW_CELL];
    if (!cell){
        cell = [[PQQActorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: ACTOR_TABLEVIEW_CELL];
    }
//    if (indexPath.row < [self.actorData count]){  //不做这层保护使有问题会在调试时暴露出来
        PQQActorModel *curActor = [self.actorData objectAtIndex: indexPath.row];
        cell.actorName.text = curActor.name;
        cell.subName.text = curActor.subname;
        [cell.photo sd_setImageWithURL:[NSURL URLWithString:curActor.photo]];
//    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [PQQActorTableViewCell cellHeight];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.actorData count];
}

//点击单元格触发的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PQQActorTableViewCell *cell = (PQQActorTableViewCell *)[self tableView:self.actorTableView cellForRowAtIndexPath:indexPath];
    [self.actorTableView deselectRowAtIndexPath:indexPath animated:YES]; //使背景颜色变回白色
    NSLog(@"%@", cell.actorName.text);
}

// set方法默认写法
//self.和_的区别：使用self.a会调用getter/setter方法，而_a并不会调用getter/setter方法,它是直接访问实例变量并赋值。
// 如果这里使用self.actorData，则不断循环调用set方法导致crush
- (void)setActorData:(NSArray *)actorData {
    if (_actorData != actorData){
        _actorData = actorData;
    }
    [self.actorTableView reloadData];
}
@end


