//
//  PQQActorView.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#ifndef PQQActorView_h
#define PQQActorView_h


#endif /* PQQActorView_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PQQActorTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *actorName;
@property (nonatomic, strong) UILabel *subName;
@property (nonatomic, strong) UIImageView *photo;
@end

@interface PQQActorView : UIView
@property (nonatomic, copy) NSArray *actorData;
//不把Data设置为atomic的原因：atomic只会对该属性的Getter和Setter方法上锁，在别的方法里面对数据进行操作无法保护属性，同时atomic太耗性能，所以在实际开发中一般不使用atomic来修饰变量
@end

