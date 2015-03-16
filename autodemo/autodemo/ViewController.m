//
//  ViewController.m
//  autodemo
//
//  Created by wcn on 15/3/16.
//  Copyright (c) 2015年 w.cn. All rights reserved.
//

#import "ViewController.h"
#import "WCNHeaderView.h"
#import "WCNHeaderViewCell.h"

#import "WCNFooterView.h"
#import "WCNFooterViewCell.h"
#import "UIImageView+WebCache.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (strong, nonatomic) NSArray *myDates;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myTableView.tableHeaderView=[[WCNHeaderView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 90)];
    
    self.myDates=@[@"http://www.xmnn.cn/pic/hdp/201503/W020150316492156390261.jpg",
                   @"http://www.xmnn.cn/2014/xwzx/jctp/201412/W020141225498684876548.png",
                   @"http://www.xmnn.cn/2014/xwzx/xmws/tw/201412/W020141228513752369895.jpg",
                   @"http://news.xmnn.cn/a/xmxw/201503/W020150316255002331093.jpg",
                   @"http://news.xmnn.cn/a/xmxw/201503/W020150316255002791270.jpg"
                   ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2 == 0){
        
        WCNFooterViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FooterViewCell" forIndexPath:indexPath];
        cell.footerView.cView.backgroundColor=[UIColor brownColor];
        cell.footerView.hLabel.text=[NSString stringWithFormat:@"row: %ld - section: %ld",(long)indexPath.row,(long)indexPath.section];
        NSString *imgStr=[self.myDates objectAtIndex:(arc4random()%self.myDates.count)];
        [cell.footerView.hImageView sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:[UIImage imageNamed:@"34.jpg"]];
        return cell;
    }else{
        
        WCNHeaderViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"HeaderViewCell" forIndexPath:indexPath];
        cell.headerView.headerLabel.text=[NSString stringWithFormat:@"row: %ld - section: %ld",(long)indexPath.row,(long)indexPath.section];
        NSString *imgStr=[self.myDates objectAtIndex:(arc4random()%self.myDates.count)];
        [cell.headerView.headerImageView sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:[UIImage imageNamed:@"34.jpg"]];
        return cell;
    }
}

#pragma mark -
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2 == 0){
        return 88;
    }else{
        return 120;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    WCNHeaderView *view=[WCNHeaderView new];
    view.backgroundColor=[UIColor grayColor];
    return view;
}

@end
