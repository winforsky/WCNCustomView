//
//  WCNFooterView.h
//  autodemo
//
//  Created by wcn on 15/3/16.
//  Copyright (c) 2015年 w.cn. All rights reserved.
//

#import "WCNHeaderView.h"
#import "WCNCustomView.h"

@interface WCNFooterView : WCNCustomView

@property (strong, nonatomic) IBOutlet UIView *cView;
@property (weak, nonatomic) IBOutlet UIImageView *hImageView;
@property (weak, nonatomic) IBOutlet UILabel *hLabel;

@end
