//
//  UIColor+BLAddition.m
//  bilibili imitation
//
//  Created by 施扬 on 16/10/1.
//  Copyright © 2016年 stan. All rights reserved.
//

#import "UIColor+BLAddition.h"

@implementation UIColor (BLAddition)

+ (instancetype)bl_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha{
    int red = (hex & 0xFF0000) >> 16;
    int green = (hex & 0x00FF00) >> 8;
    int blue = (hex & 0x0000FF);
    
    return [UIColor bl_colorWithR:red G:green B:blue alpha:alpha];
}
+ (instancetype)bl_colorWithR:(int)red G:(int)green B:(int)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}
+ (instancetype)bl_randomColor{
    return [UIColor bl_colorWithR:arc4random_uniform(256) G:arc4random_uniform(256) B:arc4random_uniform(256) alpha:1];
}

@end
