//
//  WCNHeaderView.h
//  autodemo
//
//  Created by wcn on 15/3/16.
//  Copyright (c) 2015年 w.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCNCustomView.h"

@interface WCNHeaderView : WCNCustomView

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;

@end
