//
//  STTabBar.m
//  STANTAO
//
//  Created by 施扬 on 16/10/15.
//  Copyright © 2016年 stan. All rights reserved.
//

#import "STTabBar.h"
#import "NSAttributedString+CZAdditon.h"
#define BUTTONNUMBER 5

@interface STTabBar ()

@property(nonatomic,weak) NSMutableArray <UIButton *>*buttons;

@property(nonatomic,weak) UIButton *addButton;

@property(nonatomic,weak) UIButton *selectedButton;

@end

@implementation STTabBar

-(NSMutableArray<UIButton *> *)buttons
{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

-(UIButton *)addButton
{
    if (!_addButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
 
        [btn sizeToFit];
        
        [btn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
        
        _addButton = btn;
        
        [self addSubview:_addButton];
    }
    return _addButton;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupButtons];
        self.selectedButton= self.buttons[0];
    }
    return self;
}

-(void)setupButtons
{
     [self addOneButton:@"首页" imageStr:@"home" tag:0];
     [self addOneButton:@"我淘" imageStr:@"me" tag:1];
     [self addOneButton:@"分享" imageStr:@"me_street" tag:2];
     [self addOneButton:@"购物车" imageStr:@"cart" tag:3];
     [self addOneButton:@"我的" imageStr:@"mine" tag:4];
    
}

-(void)addOneButton:(NSString *)title imageStr:(NSString*)imageStr tag:(NSInteger)tag
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_default",imageStr]] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageStr]] forState:UIControlStateSelected];
    NSString *imgDefaultStr = [NSString stringWithFormat:@"%@_default",imageStr];
    NSString *imgSelectedStr = [NSString stringWithFormat:@"%@_selected",imageStr] ;
    
//    [btn setTitle:title forState:UIControlStateNormal];
    
      [btn setAttributedTitle:[NSAttributedString cz_imageTextWithImage:[UIImage imageNamed:imgDefaultStr] imageWH:20 title:title fontSize:10 titleColor:[UIColor lightGrayColor] spacing:3] forState:UIControlStateNormal];
    [btn setAttributedTitle:[NSAttributedString cz_imageTextWithImage:[UIImage imageNamed:imgSelectedStr] imageWH:20 title:title fontSize:10 titleColor:[UIColor greenColor] spacing:3] forState:UIControlStateSelected];
    
    btn.titleLabel.text = title;
    btn.titleLabel.numberOfLines = 0;
    [btn sizeToFit];
   
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = tag;
    btn.frame = CGRectMake(self.width/BUTTONNUMBER *tag, 0, self.width/BUTTONNUMBER, self.height);
    [self.buttons addObject:btn];
    [self addSubview:btn];
    
//      NSLog(@"%@",NSStringFromCGRect(btn.frame));
   
}

-(void)btnClick:(UIButton *)sender
{
    _selectedButton.selected = NO;
    sender.selected = YES;
    _selectedButton = sender;
    if (_buttonClick) {
        _buttonClick(sender.tag);
    }
    
    if (_addButton) {
        [_addButton removeFromSuperview];
        _addButton = nil;
    }
    
    if (sender.tag == 2) {
        self.addButton.center = self.center;
        
    }
}

-(void)addClick
{
   
    
    //加好modal
    if (_buttonClick) {
        _buttonClick(5);
    }
}



@end
