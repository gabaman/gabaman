//
//  UIColor+BLAddition.h
//  bilibili imitation
//
//  Created by 施扬 on 16/10/1.
//  Copyright © 2016年 stan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BLAddition)


+ (instancetype)bl_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;

+ (instancetype)bl_colorWithR:(int)red G:(int)green B:(int)blue alpha:(CGFloat)alpha;
+ (instancetype)bl_randomColor;
@end
