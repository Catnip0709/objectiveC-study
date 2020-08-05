//
//  actorView.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "ActorView.h"
#import "Model.h"

@implementation ActorTableViewCell
+ (CGFloat)cellHeight {
    return 200;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //在这里写入定制cell的内容
        _photo = [[UIImageView alloc]initWithFrame:CGRectMake(20, 30, 140, 140)];
        _photo.image = [UIImage imageNamed:@"yyqx.png"];
        [self addSubview:_photo];
        
        _actorName = [[UILabel alloc]initWithFrame:CGRectMake(_photo.frame.origin.x + _photo.frame.size.width + 50, 60, 100, 30)];
        [_actorName setText:@"姓名"];
        [_actorName setTextColor:UIColor.blackColor];
        _actorName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_actorName];
        
        _subName = [[UILabel alloc]initWithFrame:CGRectMake(_actorName.frame.origin.x, _actorName.frame.origin.y + _actorName.frame.size.height + 30, 100, 30)];
        [_subName setText:@"角色"];
        [_subName setTextColor:UIColor.grayColor];
        _subName.textAlignment = NSTextAlignmentCenter;
        [self addSubview: _subName];
    }
    return self;
}
@end



@implementation ActorView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _actorTableView = [[UITableView alloc]initWithFrame: self.bounds];
    _actorTableView.dataSource = self;
    _actorTableView.delegate   = self;
    _actorTableView.backgroundColor = UIColor.lightGrayColor;
    [self addSubview: _actorTableView];
    
    return self;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     ActorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActorTableViewCell"];
     cell = [[ActorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ActorTableViewCell"];
    if (indexPath.row < [_actorData count]) {
        struct ActorModel curActor;
        [[_actorData objectAtIndex: indexPath.row] getValue:&curActor];
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
    return [_actorData count];
}

//点击单元格触发的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"你点了一个cell");
}
@end


