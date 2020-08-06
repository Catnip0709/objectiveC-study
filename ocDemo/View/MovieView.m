//
//  movieView.m
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "movieView.h"
#import "Model.h"

#define MOVIE_COLLECTIONVIEW_CELL @"MovieCollectionViewCell"

@implementation MovieCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.moviePic = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 150)];
        self.moviePic.image = [UIImage imageNamed:@"zjz.png"];
        [self addSubview:_moviePic];
        
        self.movieName = [[UILabel alloc] initWithFrame:CGRectMake(_moviePic.frame.origin.x, self.moviePic.frame.origin.y + self.moviePic.frame.size.height + 5, self.moviePic.frame.size.width, 25)];
         [self.movieName setText:@"电影名字"];
         [self.movieName setTextColor:UIColor.blackColor];
        self.movieName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_movieName];
        
        self.movieTime = [[UILabel alloc] initWithFrame:CGRectMake(_movieName.frame.origin.x, self.movieName.frame.origin.y + self.movieName.frame.size.height, self.moviePic.frame.size.width, 15)];
         [self.movieTime setText:@"上映时间"];
         [self.movieTime setTextColor:UIColor.grayColor];
        self.movieTime.textAlignment = NSTextAlignmentCenter;
        [self addSubview: self.movieTime];
    }
    return self;
}

@end

@interface MovieView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@end

@implementation MovieView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(140,190);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.movieCollectionView = [[UICollectionView alloc] initWithFrame: CGRectMake(0,0,self.frame.size.width,self.frame.size.height) collectionViewLayout: flowLayout];
    
    self.movieCollectionView.dataSource = self;
    self.movieCollectionView.delegate = self;
    [self.movieCollectionView registerClass:[MovieCollectionViewCell class] forCellWithReuseIdentifier: MOVIE_COLLECTIONVIEW_CELL];
    self.movieCollectionView.backgroundColor = UIColor.whiteColor;
    [self addSubview: self.movieCollectionView];
    
    return self;
}

//每个cell展示的内容的具体实现
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: MOVIE_COLLECTIONVIEW_CELL forIndexPath: indexPath];
    if(indexPath.row < [self.movieData count]) {
        MovieModel *curMovie = [self.movieData objectAtIndex: indexPath.row];
        cell.movieName.text = curMovie.movieName;
        cell.movieTime.text = curMovie.movieTime;
        [cell.moviePic setImage:[UIImage imageNamed: curMovie.moviePic]];
    }
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.movieData count];
}

//cell被选中时触发
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.selectedMovieCellHandler) {
        self.selectedMovieCellHandler(indexPath);
    }
}

@end
