//
//  BLTabBarController.m
//  bilibili imitation
//
//  Created by 施扬 on 16/9/29.
//  Copyright © 2016年 stan. All rights reserved.
//

#import "BLTabBarController.h"
#import "BLNavigationController.h"
#import "BLTabBarTransitionAnimation.h"
// UIPercentDrivenInteractiveTransition。这个类的对象会根据我们的手势，来决定我们的自定义过渡的完成度。
//    @interface UIPercentDrivenInteractiveTransition : NSObject
//    <UIViewControllerInteractiveTransitioning>
//    @property (readonly) CGFloat duration;
//    @property (readonly) CGFloat percentComplete;
//    @property (nonatomic,assign) CGFloat completionSpeed;
//    @property (nonatomic,assign) UIViewAnimationCurve
//    completionCurve;
//    - (void)updateInteractiveTransition:(CGFloat)percentComplete;
//    - (void)cancelInteractiveTransition;
//    - (void)finishInteractiveTransition;

@interface BLTabBarController ()<UITabBarControllerDelegate>

@property(nonatomic,strong) UIPercentDrivenInteractiveTransition *interactionController;

@property(nonatomic,assign) BOOL direction ;
@property(nonatomic,assign) NSInteger lastIndex;
@property(nonatomic,assign) BOOL isInteraction;//用于判断是否为手势转场，如果是点击下方tabbar转场，则不需要转场动画

@end

@implementation BLTabBarController

-(UIPercentDrivenInteractiveTransition *)interactionController
{
    if (!_interactionController) {
        _interactionController = [[UIPercentDrivenInteractiveTransition alloc]init];
    }
    return _interactionController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupAllControllers];
    }
    return self;
}
#pragma mark - 手势判断
//tabbar pan手势转场动画需求:
//手势滑动超过半个屏幕时 完成滑动
//手势滑动速度大于一定数值时 完成滑动
-(void)estimateGesture:(UIPanGestureRecognizer*)gesture
{

    CGFloat translationX = [gesture translationInView:gesture.view].x;
  
    CGFloat progressNum = fabs(translationX)/kScreenSize.width;
//    NSLog(@"%f",progressNum);
    
    NSTimeInterval beginTime ;
    
    _lastIndex = self.selectedIndex;
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            beginTime = CACurrentMediaTime();
            _isInteraction = YES;
            if (translationX<0) {
                self.selectedIndex++;
            }else{
                self.selectedIndex--;
            }
        }
            

        case UIGestureRecognizerStateChanged:
            
            //让其只能往一个方向滑动
            if (translationX < 0&&_lastIndex>self.selectedIndex) {
                progressNum =0;
            }else if(translationX > 0&&_lastIndex<self.selectedIndex){
                progressNum =0;
            }
            
            [_interactionController updateInteractiveTransition:progressNum];
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            CGFloat speed =  fabs(translationX)/(CACurrentMediaTime()-beginTime);
            self.interactionController.completionSpeed = 0.99;
            if (progressNum > 0.5||speed>600) {
                [self.interactionController finishInteractiveTransition];
                
            }
            else {
                [self.interactionController cancelInteractiveTransition];
           
            }
           
            _isInteraction = NO;
            self.interactionController = nil;
        }
           
            break;
        default:
            break;
    }
}


-(void)setupAllControllers
{
    BLNavigationController *homeNavVC = [BLNavigationController initWithRootViewControllerwithTitle:@"首页" withImage:@"home_home_tab" className:@"BLHomeController"];
                                         
    
    
    BLNavigationController *zoneNavVC = [BLNavigationController initWithRootViewControllerwithTitle:@"分区" withImage:@"home_category_tab" className:@"BLZoneController"];
    BLNavigationController *focusNavVC = [BLNavigationController initWithRootViewControllerwithTitle:@"关注" withImage:@"home_attention_tab" className:@"BLFocusController"];
    BLNavigationController *findNavVC = [BLNavigationController initWithRootViewControllerwithTitle:@"发现" withImage:@"home_discovery_tab" className:@"BLFindController"];
    BLNavigationController *mineNavVC = [BLNavigationController initWithRootViewControllerwithTitle:@"我的" withImage:@"home_mine_tab" className:@"BLMineController"];
    self.viewControllers = @[homeNavVC,zoneNavVC,focusNavVC,findNavVC,mineNavVC];
    self.tabBar.translucent = NO;
    self.delegate = self;
}

#pragma mark - 设置转场动画
-(id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (!_isInteraction) {
        return NULL;
    }
    
    NSInteger fromIndex = [tabBarController.viewControllers indexOfObject:fromVC];
    NSInteger toIndex = [tabBarController.viewControllers indexOfObject:toVC];
    TabTransitionDirection direction = toIndex < fromIndex ? TabTransitionDirectionLeft : TabTransitionDirectionRight;
    return [[BLTabBarTransitionAnimation alloc] initWithDirection:direction];
}

- (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController; {
    if (_isInteraction) {
        
        return self.interactionController;
    }
    return NULL;
}

@end
