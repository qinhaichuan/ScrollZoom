//
//  ViewController.m
//  ScrollZoom
//
//  Created by QHC on 5/17/16.
//  Copyright © 2016 秦海川. All rights reserved.
//

#import "ViewController.h"
#import "BannerCollectionViewCell.h"
#import "ScrollZoomFlowLayout.h"

#define kBANNER_COLLECTIONVIEW_CELL @"BannerCollectionViewCell"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *collectionV;
@property(nonatomic, strong) ScrollZoomFlowLayout *scrollZoomFlowLayout;

@end

@implementation ViewController

- (ScrollZoomFlowLayout *)scrollZoomFlowLayout
{
    if (!_scrollZoomFlowLayout) {
        _scrollZoomFlowLayout = [[ScrollZoomFlowLayout alloc] init];
        _scrollZoomFlowLayout.minimumLineSpacing = 15.0f;
        _scrollZoomFlowLayout.minimumInteritemSpacing = 15.0f;
        _scrollZoomFlowLayout.itemSize = CGSizeMake(250, 200);
        _scrollZoomFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        CGFloat layoutX = self.view.center.x - _scrollZoomFlowLayout.itemSize.width * 0.5;
        _scrollZoomFlowLayout.sectionInset = UIEdgeInsetsMake(0, layoutX, 0, layoutX);
    }
    return _scrollZoomFlowLayout;

}

- (UICollectionView *)collectionV
{
    if (!_collectionV) {
        _collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 300) collectionViewLayout:self.scrollZoomFlowLayout];
        _collectionV.delegate = self;
        _collectionV.dataSource = self;
        _collectionV.backgroundColor = [UIColor purpleColor];
        [_collectionV registerClass:[BannerCollectionViewCell class] forCellWithReuseIdentifier:kBANNER_COLLECTIONVIEW_CELL];
    }
    return _collectionV;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.collectionV];

}

#pragma mark ---- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBANNER_COLLECTIONVIEW_CELL forIndexPath:indexPath];
    cell.titleStr = [NSString stringWithFormat:@"%zd", indexPath.item];
    cell.imageName = [NSString stringWithFormat:@"%zd.jpg", indexPath.item % 2 + 1];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
