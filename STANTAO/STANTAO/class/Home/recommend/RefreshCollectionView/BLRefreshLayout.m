//
//  BLRefreshLayout.m
//  bilibili imitation
//
//  Created by 施扬 on 16/10/6.
//  Copyright © 2016年 stan. All rights reserved.
//

#import "BLRefreshLayout.h"

@implementation BLRefreshLayout

-(void)prepareLayout
{
    [super prepareLayout];
    
    // 137:85 313 13 13 13 274
    CGFloat itemWidth = (kScreenSize.width - 15*3) / 2;
    CGFloat margin = 15;
    
    self.itemSize =  CGSizeMake(itemWidth, itemWidth * 0.625 + 30);
    self.minimumInteritemSpacing = margin;
    self.minimumLineSpacing = margin;
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
}

@end
