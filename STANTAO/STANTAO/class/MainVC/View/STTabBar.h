//
//  STTabBar.h
//  STANTAO
//
//  Created by 施扬 on 16/10/15.
//  Copyright © 2016年 stan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClick)(NSInteger tag);

@interface STTabBar : UIView

@property(nonatomic,copy) ButtonClick buttonClick;

@end
