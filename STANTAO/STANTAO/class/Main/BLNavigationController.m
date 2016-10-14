//
//  BLNavigationController.m
//  bilibili imitation
//
//  Created by 施扬 on 16/9/29.
//  Copyright © 2016年 stan. All rights reserved.
//

#import "BLNavigationController.h"

@interface BLNavigationController ()

@end

@implementation BLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+(instancetype)initWithRootViewControllerwithTitle:(NSString*)title withImage:(NSString*)imageString className:(NSString*)className
{
    
    
   Class RootVC = NSClassFromString(className);
    
    UIViewController *rootVC =  [[RootVC alloc]init];
    
    
    
    rootVC.navigationItem.title = title;
    
    rootVC.tabBarItem.image = [[UIImage imageNamed:imageString] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    rootVC.tabBarItem.selectedImage = [[UIImage imageNamed:[imageString stringByAppendingString:@"_s"] ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    rootVC.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    BLNavigationController *navVC = [[BLNavigationController alloc]initWithRootViewController:rootVC];
    
    navVC.navigationBar.translucent = NO;
    
    return navVC;
}



- (UIStatusBarStyle)preferredStatusBarStyle; {
    return UIStatusBarStyleLightContent;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return toInterfaceOrientation == UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
