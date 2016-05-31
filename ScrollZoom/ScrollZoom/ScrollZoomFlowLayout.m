//
//  ScrollZoomFlowLayout.m
//  ScrollZoom
//
//  Created by QHC on 5/27/16.
//  Copyright © 2016 秦海川. All rights reserved.
//

#import "ScrollZoomFlowLayout.h"

@implementation ScrollZoomFlowLayout

/**
 *  预加载, 只会执行一次
 */
- (void)prepareLayout
{
    [super prepareLayout];
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 初始化坐标
    CGFloat itemX = self.collectionView.contentOffset.x;
    CGFloat itemY = 0;
    CGFloat itemW = self.collectionView.frame.size.width;
    CGFloat itemH = self.collectionView.frame.size.height;
    
    NSArray *attributesArrary = [super layoutAttributesForElementsInRect:CGRectMake(itemX, itemY, itemW, itemH)];
    for (UICollectionViewLayoutAttributes *attribute in attributesArrary) {
        
        // 图片中心点到collectionView左侧距离
        CGFloat leftX = attribute.center.x - self.collectionView.contentOffset.x;
        // collectionView中心点
        CGFloat centerX = self.collectionView.frame.size.width * 0.5;
        // item距离中心距离(取绝对值)
        CGFloat lengthToCenter = fabs(leftX - centerX);
        // 比例
        CGFloat factor = 1 - lengthToCenter / centerX;
        CGFloat scale = factor * 0.1 + 1;
        
        attribute.transform = CGAffineTransformMakeScale(scale, scale);
        
        
    }
    return attributesArrary;
}

/**
 *  返回值: 最终contentOffset
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    // 初始化坐标
    CGFloat itemX = self.collectionView.contentOffset.x;
    CGFloat itemY = 0;
    CGFloat itemW = self.collectionView.frame.size.width;
    CGFloat itemH = self.collectionView.frame.size.height;
    
    NSArray *attributesArrary = [super layoutAttributesForElementsInRect:CGRectMake(itemX, itemY, itemW, itemH)];
    CGFloat proposedContentOffsetX = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attribute in attributesArrary) {
        
        // 图片中心点到collectionView左侧距离
        CGFloat leftX = attribute.center.x - proposedContentOffset.x;
        // collectionView中心点
        CGFloat centerX = self.collectionView.frame.size.width * 0.5;
        // item距离中心距离
        CGFloat lengthToCenter = fabs(centerX - leftX);
        
        if (lengthToCenter < proposedContentOffsetX) {
            proposedContentOffsetX = centerX - leftX;
        }
        
    }
    proposedContentOffset.x -= proposedContentOffsetX;
    NSLog(@"====%@", NSStringFromCGPoint(proposedContentOffset));
    return proposedContentOffset;
}

/**
 *  重新布局
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    [super shouldInvalidateLayoutForBoundsChange:newBounds];
    return YES;
}

//- (CGSize)collectionViewContentSize
//{
//   return [super collectionViewContentSize];
//}

@end
