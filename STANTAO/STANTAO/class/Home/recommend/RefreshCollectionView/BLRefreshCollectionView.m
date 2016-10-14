//
//  BLRefreshCollectionView.m
//  bilibili imitation
//
//  Created by 施扬 on 16/10/6.
//  Copyright © 2016年 stan. All rights reserved.
//

#import "BLRefreshCollectionView.h"
#import "BLRefreshLayout.h"



@implementation BLRefreshCollectionView



- (instancetype)init
{
    BLRefreshLayout *layout = [[BLRefreshLayout alloc]init];
    self = [super initWithFrame:CGRectZero collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
      
        self.alwaysBounceVertical = YES;
    }
    return self;
}





@end
