//
//  STNavigationController.m
//  STANTAO
//
//  Created by 施扬 on 16/10/15.
//  Copyright © 2016年 stan. All rights reserved.
//

#import "STNavigationController.h"

@interface STNavigationController ()

@end

@implementation STNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+(void)initialize
{
    //设置字体颜色
    
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    
    titleAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [item setTitleTextAttributes:titleAttr forState:UIControlStateNormal];
    
}



@end
