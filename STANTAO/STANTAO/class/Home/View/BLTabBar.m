//
//  BLTabBar.m
//  bilibili imitation
//
//  Created by 施扬 on 16/9/30.
//  Copyright © 2016年 stan. All rights reserved.
//

#import "BLTabBar.h"
#import "UIColor+BLAddition.h"

#define kButtonW (kScreenSize.width-_leftEdge*2-(_btnNumber-1)*_margin)/_btnNumber

@interface BLTabBar ()

@property(nonatomic,assign) NSInteger btnNumber;

@property(nonatomic,weak) UIView *selLineView;

@property(nonatomic,strong) NSMutableArray <UIButton *> *buttonArray;

@end

@implementation BLTabBar

-(NSMutableArray<UIButton *> *)buttonArray
{
    if (_buttonArray == nil) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

- (instancetype)initWithTitles:(NSArray<NSString *> *)titles
{
     if (self = [super init]) {
        
         self.backgroundColor = [UIColor bl_colorWithR:253 G:129 B:164 alpha:1];
         self.buttonColor = [UIColor bl_colorWithR:230 G:230 B:230 alpha:1];
         self.selButtonColor = [UIColor bl_colorWithR:255 G:255 B:255 alpha:1];
         self.leftEdge = (kScreenSize.width-50*titles.count)/2;
      
         self.margin = 20;
         [self setupButtons:(NSArray<NSString *> *)titles];
     }
    return self;
}

-(void)setupButtons:(NSArray<NSString *> *)titles
{
    _btnNumber = titles.count;
    
    for (int i = 0; i<_btnNumber; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        
        [button setTitleColor:_buttonColor forState:UIControlStateNormal];
        [button setTitleColor:_selButtonColor forState:UIControlStateSelected];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.tag = i;
        
        [self.buttonArray addObject:button];
        [self addSubview:button];
    }
    
    self.selectedIndex = 0;
    
    //选中条
    UIView *selLineView = [[UIView alloc]init];
    selLineView.backgroundColor = _selButtonColor;
    
    _selLineView = selLineView;
    [self addSubview:selLineView];
    
    
}

-(void)btnClick:(UIButton *)sender
{
//    self.selectedIndex = sender.tag;
    
    if (_clickButton) {
        _clickButton(sender.tag);
    }
}


// 1-2-3
-(void)setContentOffset:(CGFloat)contentOffset
{

        CGFloat lineX = _leftEdge + contentOffset*(kButtonW+_margin);
    
        _selLineView.frame = CGRectMake(lineX, self.height-4, kButtonW, 2);
    
        _contentOffset = contentOffset;
    
      self.selectedIndex = round(contentOffset);
    
}

-(void)setSelectedIndex:(NSInteger)selectedIndex
{
    
    if (selectedIndex<_buttonArray.count) {
        _buttonArray[_selectedIndex].selected = NO;
        _buttonArray[selectedIndex].selected = YES;
    }
    
    _selectedIndex = selectedIndex;

}

//默认颜色
-(UIColor *)buttonColor
{
    if (!_buttonColor) {
        _buttonColor = [UIColor bl_colorWithR:200 G:200 B:200 alpha:1];
    }
    return _buttonColor;
}
//默认选中颜色
-(UIColor *)selButtonColor
{
    if (!_selButtonColor) {
        _selButtonColor = [UIColor bl_colorWithR:253 G:129 B:164 alpha:1];
    }
    return _selButtonColor;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
//    CGFloat buttonW = (kScreenSize.width - _leftEdge*2 - (_btnNumber-1)*_margin)/_btnNumber;
    
    
    for (UIButton *button in _buttonArray) {
        CGFloat buttonX = _leftEdge + button.tag*(kButtonW+_margin);
        
        button.frame = CGRectMake(buttonX, 0, kButtonW,self.height-2);
        
    }
    
    CGFloat lineX = _leftEdge + _selectedIndex*(kButtonW+_margin);
    
    _selLineView.frame = CGRectMake(lineX, self.height-4, kButtonW, 2);
}

@end
