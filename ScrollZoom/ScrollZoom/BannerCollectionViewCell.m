//
//  BannerCollectionViewCell.m
//  ScrollZoom
//
//  Created by QHC on 5/17/16.
//  Copyright © 2016 秦海川. All rights reserved.
//

#import "BannerCollectionViewCell.h"

@interface BannerCollectionViewCell()

@property(nonatomic, weak) UIImageView *imageV;
@property(nonatomic, weak) UILabel *titleLbl;

@end


@implementation BannerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
      
        self.backgroundColor = [UIColor redColor];
        self.layer.borderColor = [UIColor greenColor].CGColor;
        self.layer.borderWidth = 2.0f;
        
        UIImageView *imageV = [[UIImageView alloc] init];
        self.imageV = imageV;
        [self.contentView addSubview:imageV];
        
        UILabel *titleLbl = [[UILabel alloc] init];
        self.titleLbl = titleLbl;
        titleLbl.backgroundColor = [UIColor lightGrayColor];
        titleLbl.textAlignment = NSTextAlignmentCenter;
        titleLbl.textColor = [UIColor yellowColor];
        [self.contentView addSubview:titleLbl];
        
        
    }

    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageV.frame = CGRectMake(0, 0, self.bounds.size.width, 180);
    self.titleLbl.frame = CGRectMake(0, 180, self.bounds.size.width, 20);
    
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.imageV.image = [UIImage imageNamed:imageName];
}

- (void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    self.titleLbl.text = titleStr;
}

@end
