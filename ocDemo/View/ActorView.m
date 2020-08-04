//
//  actorView.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import "ActorView.h"

@implementation ActorTableViewCell
+ (CGFloat)cellHeight {
    return 200;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //在这里写入定制cell的内容
        photo = [[UIImageView alloc]initWithFrame:CGRectMake(20, 30, 140, 140)];
        photo.image = [UIImage imageNamed:@"yyqx.png"];
        [self addSubview:photo];
        
        actorName = [[UILabel alloc]initWithFrame:CGRectMake(photo.frame.origin.x + photo.frame.size.width + 50, 60, 100, 30)];
        [actorName setText:@"姓名"];
        [actorName setTextColor:UIColor.blackColor];
        actorName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:actorName];
        
        subName = [[UILabel alloc]initWithFrame:CGRectMake(actorName.frame.origin.x, actorName.frame.origin.y + actorName.frame.size.height + 30, 100, 30)];
        [subName setText:@"角色"];
        [subName setTextColor:UIColor.grayColor];
        subName.textAlignment = NSTextAlignmentCenter;
        [self addSubview: subName];
    }
    return self;
}
@end



@implementation ActorView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    actorTableView = [[UITableView alloc]initWithFrame: self.bounds];
    actorTableView.dataSource = self;
    actorTableView.delegate   = self;
    actorTableView.backgroundColor = UIColor.lightGrayColor;
    [self addSubview: actorTableView];
    
    return self;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     ActorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActorTableViewCell"];

    if (indexPath.row < 5) {
        cell = [[ActorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ActorTableViewCell"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ActorTableViewCell cellHeight];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

//点击单元格触发的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"你点了一个cell");
}
@end


