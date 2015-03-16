//
//  WCNCustomView.m
//  autodemo
//
//  Created by wcn on 15/3/16.
//  Copyright (c) 2015年 w.cn. All rights reserved.
//

#import "WCNCustomView.h"

@implementation WCNCustomView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (id)init
{
    NSLog(@"%s", __func__);
    if (self=[super init]) {
        [self configView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"%s", __func__);
    if (self=[super initWithFrame:frame]) {
        [self configView];
    }
    return self;
}

//  注意事项
//- (id)initWithCoder:(NSCoder *)aDecoder 与 - (void)awakeFromNib 二选一
//  否则出现 两层
//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    NSLog(@"%s", __func__);
//    if (self=[super initWithCoder:aDecoder]) {
//        [self configView];
//    }
//    return self;
//}

//  注意事项
//- (id)initWithCoder:(NSCoder *)aDecoder 与 - (void)awakeFromNib 二选一
//  否则出现 两层
- (void)awakeFromNib
{
    NSLog(@"%s", __func__);
    [self configView];
}

- (void)configView
{
    UIView *view=[[[NSBundle mainBundle]loadNibNamed: NSStringFromClass([self class])  owner:self options:nil]firstObject];
    
    [self addSubview:view];
    
    view.translatesAutoresizingMaskIntoConstraints=NO;
    
    [self addConstraint:[self pin:view attribute:NSLayoutAttributeTop]];
    [self addConstraint:[self pin:view attribute:NSLayoutAttributeLeft]];
    [self addConstraint:[self pin:view attribute:NSLayoutAttributeBottom]];
    [self addConstraint:[self pin:view attribute:NSLayoutAttributeRight]];
}

- (NSLayoutConstraint*)pin:(id)item attribute:(NSLayoutAttribute)attribute
{
    return [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:item attribute:attribute multiplier:1 constant:0];
}


@end
