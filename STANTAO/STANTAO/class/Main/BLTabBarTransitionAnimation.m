//
//  BLTabBarTransitionAnimation.m
//  bilibili imitation
//
//  Created by 施扬 on 16/9/29.
//  Copyright © 2016年 stan. All rights reserved.
//

#import "BLTabBarTransitionAnimation.h"

@interface BLTabBarTransitionAnimation()

@property(nonatomic,assign) TabTransitionDirection dragDirection;

@end

@implementation BLTabBarTransitionAnimation

-(instancetype)initWithDirection:(TabTransitionDirection)direction
{
    if ( self = [super init]) {
        _dragDirection = direction;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *container  = [transitionContext containerView];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
   
    
    CGAffineTransform fromTransform = CGAffineTransformIdentity;
    CGAffineTransform toTransform = CGAffineTransformIdentity;
    
    if (_dragDirection == TabTransitionDirectionLeft) {
        toTransform = CGAffineTransformMakeTranslation(-container.width, 0);
        fromTransform = CGAffineTransformMakeTranslation(container.width, 0);
    }else{
        toTransform = CGAffineTransformMakeTranslation(container.width, 0);
        fromTransform = CGAffineTransformMakeTranslation(-container.width, 0);
    }
    
    toVC.view.transform = toTransform;
    
    [container addSubview:toVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVC.view.transform = fromTransform;
        toVC.view.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished) {
        fromVC.view.transform = CGAffineTransformIdentity;
        toVC.view.transform = CGAffineTransformIdentity;
        BOOL isCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!isCancelled];
    
    }];
    
    
    
//    UIView *containerView = [transitionContext containerView];
//    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    UIView *fromView = fromVC.view;
//    UIView *toView = toVC.view;
//    
//    
//    CGAffineTransform toViewTransform = CGAffineTransformIdentity;
//    CGAffineTransform fromViewTransform = CGAffineTransformIdentity;
//    
//    
//    if (_dragDirection == TabTransitionDirectionLeft) {
//        toViewTransform = CGAffineTransformMakeTranslation(-containerView.frame.size.width, 0);
//        fromViewTransform = CGAffineTransformMakeTranslation(containerView.frame.size.width, 0);
//    }
//    else {
//        toViewTransform = CGAffineTransformMakeTranslation(containerView.frame.size.width, 0);
//        fromViewTransform = CGAffineTransformMakeTranslation(-containerView.frame.size.width, 0);
//    }
//    
//    [containerView addSubview:toView];
//    
//    toView.transform = toViewTransform;
//    
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        toView.transform = CGAffineTransformIdentity;
//        fromView.transform = fromViewTransform;
//    } completion:^(BOOL finished) {
//        toView.transform = CGAffineTransformIdentity;
//        fromView.transform = CGAffineTransformIdentity;
//        BOOL isCancelled = [transitionContext transitionWasCancelled];
//        [transitionContext completeTransition:!isCancelled];
//    }];
    
}

@end
