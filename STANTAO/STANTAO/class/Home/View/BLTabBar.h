//
//  BLTabBar.h
//  bilibili imitation
//
//  Created by 施扬 on 16/9/30.
//  Copyright © 2016年 stan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickButton)(NSInteger);

@interface BLTabBar : UIView

@property(nonatomic,assign) NSInteger selectedIndex;

@property(nonatomic,assign) CGFloat leftEdge;

@property(nonatomic,assign) CGFloat margin;

@property(nonatomic,strong) UIColor *buttonColor;

@property(nonatomic,strong) UIColor *selButtonColor;

@property(nonatomic,copy) ClickButton clickButton;

@property(nonatomic,assign)CGFloat contentOffset;


- (instancetype)initWithTitles:(NSArray<NSString *> *)titles;



@end
