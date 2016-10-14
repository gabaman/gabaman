//
//  BLRecommendController.m
//  bilibili imitation
//
//  Created by 施扬 on 16/9/30.
//  Copyright © 2016年 stan. All rights reserved.
//

#import "BLRecommendController.h"
#import "ZFBSlideView.h"

@interface BLRecommendController ()


@property(nonatomic,weak) UICollectionView *colView;

@end

@implementation BLRecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    [self setupColView];
}

-(void)setupColView
{
    UICollectionView *colView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    
    _colView = colView;
    
    [self.view addSubview:colView];
   
    //http://stan.oss-cn-shanghai.aliyuncs.com/2.jpg
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0 ; i<5; i++) {
        NSString *urlStr = [NSString stringWithFormat:@"http://stan.oss-cn-shanghai.aliyuncs.com/%d.jpg",i];
        NSURL *url = [NSURL URLWithString:urlStr];
        [array addObject:url];
    }
    
    ZFBSlideView *slideView = [[ZFBSlideView alloc]init];
    [self.view addSubview:slideView];
    

    
    slideView.imageUrls = array;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}


@end
