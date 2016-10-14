//
//  BLTabBarTransitionAnimation.h
//  bilibili imitation
//
//  Created by 施扬 on 16/9/29.
//  Copyright © 2016年 stan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TabTransitionDirection) {
    TabTransitionDirectionLeft,
    TabTransitionDirectionRight
};

@interface BLTabBarTransitionAnimation : NSObject <UIViewControllerAnimatedTransitioning>

-(instancetype)initWithDirection:(TabTransitionDirection)direction;

@end
