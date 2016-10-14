//
//  BLHomeController.m
//  bilibili imitation
//
//  Created by 施扬 on 16/9/29.
//  Copyright © 2016年 stan. All rights reserved.
//  一个scrollview+一个头部

#import "BLHomeController.h"
#import "BLTabBar.h"
#import "BLRecommendController.h"
#import "BLLiveController.h"
#import "BLDramaController.h"
#import "BLTabBarController.h"

@interface BLHomeController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property(nonatomic,weak) BLTabBar *headerView;
@property(nonatomic,weak) UIScrollView *scrollView;
@end

@implementation BLHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addSubVC];
    [self setupAllSubviews];
}

-(void)addSubVC
{
    BLRecommendController *recommendVC = [[BLRecommendController alloc]init];
    BLLiveController *liveVC = [[BLLiveController alloc]init];
    BLDramaController *dramaVC = [[BLDramaController alloc]init];
    
    [self addChildViewController:recommendVC];
    [self addChildViewController:liveVC];
    [self addChildViewController:dramaVC];
    
   
}


-(void)homeAddGesture
{
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    
    [_scrollView addGestureRecognizer:panGesture];
    
    panGesture.delegate = self;
 
}

-(void)panGesture:(UIPanGestureRecognizer*)gesture
{
    BLTabBarController *tabbar = (BLTabBarController *)self.tabBarController;
    [tabbar estimateGesture:gesture];
}


-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (_scrollView.contentOffset.x<2*kScreenSize.width) {
        return NO;
    }
    
    UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer*)gestureRecognizer;
    
    CGFloat translateX = [panGesture translationInView:_scrollView].x;
    
    if (translateX>=0) {
        return NO;
    }
    return YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _headerView.contentOffset = scrollView.contentOffset.x / self.view.width;
}

-(void)setupAllSubviews
{
//headerView
    BLTabBar *headerView = [[BLTabBar alloc]initWithTitles:@[@"直播",@"推荐",@"番剧"]];
    [self.view addSubview:headerView];
    
    __weak BLHomeController *weakSelf = self;
    headerView.clickButton = ^(NSInteger index){
        [weakSelf.scrollView setContentOffset:CGPointMake(index*kScreenSize.width, 0) animated:YES];
    };
    _headerView = headerView;
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view).offset = 20;
        make.height.equalTo(@(44));
    }];
    
//scrollView
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;

    [self.view addSubview:scrollView];
   
    _scrollView =scrollView;
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerView.mas_bottom);
        make.leading.trailing.bottom.equalTo(self.view);
    }];
    [self.view layoutIfNeeded];
    scrollView.contentSize = CGSizeMake(scrollView.width *3, scrollView.height);
    
   
    
    int i = 0;
    
    for (UIViewController *controller in self.childViewControllers) {
        [scrollView addSubview:controller.view];
        
        [controller.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(scrollView).mas_offset(i*scrollView.width);
            make.top.equalTo(scrollView);
            make.width.height.equalTo(scrollView);
        }];
        
        i++;
    }
    
    [self homeAddGesture];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}


@end
