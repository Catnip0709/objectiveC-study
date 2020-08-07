//
//  movieView.h
//  ocDemo
//
//  Created by catnip on 2020/8/4.
//  Copyright © 2020 catnip. All rights reserved.
//

#ifndef movieView_h
#define movieView_h


#endif /* movieView_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PQQMovieCollectionViewCell: UICollectionViewCell
@property (nonatomic, strong) UILabel *movieName;
@property (nonatomic, strong) UILabel *movieTime;
@property (nonatomic, strong) UIImageView *moviePic;
@end

@interface PQQMovieLayout : UICollectionViewFlowLayout
@end

@interface PQQMovieView : UIView
@property (nonatomic, strong) UICollectionView *movieCollectionView;
@property (nonatomic, copy) NSArray *movieData;
@property (nonatomic, assign) NSInteger selectedMovieId;
@property (nonatomic, copy) void(^selectedMovieCellHandler)(NSInteger); // 点击电影cell的回调

- (void)scrollToSelected;

@end
