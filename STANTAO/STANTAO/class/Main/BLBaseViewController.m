//
//  BLBaseViewController.m
//  bilibili imitation
//
//  Created by 施扬 on 16/9/29.
//  Copyright © 2016年 stan. All rights reserved.
//

#import "BLBaseViewController.h"
#import "BLTabBarController.h"

@interface BLBaseViewController ()

@end

@implementation BLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addGesture];
}

-(void)addGesture
{
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:panGesture];
}

-(void)pan:(UIPanGestureRecognizer *)gesture
{
    BLTabBarController *tabBarVC = (BLTabBarController*)self.tabBarController;
    
    [tabBarVC estimateGesture:gesture];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}


@end
