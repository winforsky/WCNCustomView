//
//  WCNTextField.m
//  autodemo
//
//  Created by wcn on 15/3/16.
//  Copyright (c) 2015年 w.cn. All rights reserved.
//

#import "WCNTextField.h"
#import <QuartzCore/QuartzCore.h>

@interface WCNTextField ()

@property(nonatomic, strong)UIImageView *bgImagView;

@end

@implementation WCNTextField

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
    self.layer.cornerRadius=4.0f;
    self.layer.masksToBounds=YES;
    self.backgroundColor=[UIColor greenColor];
    self.layer.borderColor=[UIColor brownColor].CGColor;
    self.layer.borderWidth=1.0f;
    
    _bgImagView=[UIImageView new];
    [self insertSubview:_bgImagView atIndex:0];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _bgImagView.frame=self.bounds;
    _bgImagView.image=[[UIImage imageNamed:@"34.jpg"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 70, 40, 70)];
}




@end
