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


@implementation MovieLayout

- (instancetype)init {
    self = [super init];
    self.itemSize = CGSizeMake(140,190);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.sectionInset = UIEdgeInsetsMake(0, self.itemSize.width, 0, self.itemSize.width); //使得一开始firstMovie在最中间
    
    return self;
}

-(NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray<__kindof UICollectionViewLayoutAttributes *> *array = [super layoutAttributesForElementsInRect: rect];
    //计算CollectionView最中心的x值
    double cenX = (self.collectionView.contentOffset.x) + self.collectionView.frame.size.width / 2;
    for(int i = 0; i < [array count]; i++) {
        double delta = fabs(array[i].center.x - cenX); //根据间距值计算cell的缩放的比例
        double scale = 1 - delta/self.collectionView.frame.size.width;//这里scale 必须要 小于1
        array[i].transform = CGAffineTransformMakeScale(scale, scale);
    }
    return array;
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end




@interface MovieView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@end

@implementation MovieView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    UICollectionViewFlowLayout* flowLayout = [[MovieLayout alloc] init];
    self.movieCollectionView = [[UICollectionView alloc] initWithFrame: CGRectMake(0,0,self.frame.size.width,self.frame.size.height) collectionViewLayout: flowLayout];
    
    self.movieCollectionView.dataSource = self;
    self.movieCollectionView.delegate = self;
    [self.movieCollectionView registerClass:[MovieCollectionViewCell class] forCellWithReuseIdentifier: MOVIE_COLLECTIONVIEW_CELL];
    self.movieCollectionView.backgroundColor = UIColor.whiteColor;
    [self addSubview: self.movieCollectionView];
    
    if(self.movieData) {
        self.selectedMovieId = 0;
    }
    
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
    self.selectedMovieId = indexPath.row;
    [self.movieCollectionView scrollToItemAtIndexPath: [NSIndexPath indexPathForItem: self.selectedMovieId inSection: 0] atScrollPosition: (UICollectionViewScrollPositionCenteredHorizontally) animated: YES];
    if(self.selectedMovieCellHandler) {
        self.selectedMovieCellHandler(self.selectedMovieId);
    }
}

- (void)setMovieData:(NSArray *)movieData {
    if(_movieData != movieData) {
        _movieData = movieData;
    }
    [self.movieCollectionView reloadData];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self scrollToSelected];
}

//Decelerating:减速
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollToSelected];
}

- (void) scrollToSelected {
    float tempId = (self.movieCollectionView.contentOffset.x - 75) / 150;
    self.selectedMovieId = tempId < 0 ? 0 : ceil(tempId);
    //位置变化，使目的电影到最中间
    [self.movieCollectionView scrollToItemAtIndexPath: [NSIndexPath indexPathForItem: self.selectedMovieId inSection: 0] atScrollPosition: (UICollectionViewScrollPositionCenteredHorizontally) animated: YES];
    if(self.selectedMovieCellHandler) {
        self.selectedMovieCellHandler(self.selectedMovieId);
    }
}


@end
