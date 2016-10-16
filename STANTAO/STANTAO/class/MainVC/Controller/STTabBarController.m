//
//  STTabBarController.m
//  STANTAO
//
//  Created by 施扬 on 16/10/15.
//  Copyright © 2016年 stan. All rights reserved.
//

#import "STTabBarController.h"
#import "STTabBar.h"
#import "STNavigationController.h"
#import "STMiniController.h"
#import "STCartController.h"
#import "STHomeController.h"
#import "STMineController.h"
#import "STShareController.h"

@interface STTabBarController ()

@property(nonatomic,weak) STTabBar *tabbar;

@end

@implementation STTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVC];
    
    [self setupTabBar];
}

-(void)setupTabBar
{
    STTabBar *tabbar = [[STTabBar alloc]initWithFrame:self.tabBar.bounds];
    
    __weak STTabBarController *weakSelf = self;
    tabbar.backgroundColor = [UIColor whiteColor];
    
    tabbar.buttonClick = ^(NSInteger tag){
      
     
        
        if (tag == 6) {
            //modal
        }else{
            weakSelf.selectedIndex = tag;
        }
        
        
    };
    [self.tabBar addSubview:tabbar];

    _tabbar = tabbar;
   
}



-(void)setupChildVC
{
    NSMutableArray *navArray = [NSMutableArray array];
    [navArray addObject:[self addChildControllerWith:@"STHomeController" title:@"首页" normalImage:@"home"]];
    [navArray addObject:[self addChildControllerWith:@"STMiniController" title:@"微淘" normalImage:@"me"]];
    [navArray addObject:[self addChildControllerWith:@"STShareController" title:@"分享" normalImage:@"me_street"]];
    [navArray addObject:[self addChildControllerWith:@"STCartController" title:@"购物车" normalImage:@"cart"]];
    [navArray addObject:[self addChildControllerWith:@"STMineController" title:@"我的" normalImage:@"mine"]];
    
    self.viewControllers = navArray;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //移除系统的tabbarButton
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton removeFromSuperview];
        }
    }
}

- (STNavigationController *)addChildControllerWith:(NSString *)clsName title:(NSString *)title normalImage:(NSString *)normalImage {
    
    Class cls = NSClassFromString(clsName);

    UIViewController *controller = [[cls alloc] init];
    

    controller.title = title;

    NSString *normalName = [normalImage stringByAppendingString:@"_default"];
    
    NSString *selName = [normalImage stringByAppendingString:@"_selected"];
    
    controller.tabBarItem.image = [UIImage imageNamed:normalName];
    
    UIImage *selImage = [[UIImage imageNamed:selName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    controller.tabBarItem.selectedImage = selImage;

    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x643205)} forState:UIControlStateSelected];
    
    STNavigationController *nav = [[STNavigationController alloc] initWithRootViewController:controller];
    
    return nav;
}


@end
