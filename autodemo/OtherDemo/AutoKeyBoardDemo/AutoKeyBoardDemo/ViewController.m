//
//  ViewController.m
//  AutoKeyBoardDemo
//
//  Created by wcn on 15/3/31.
//  Copyright (c) 2015年 w.cn. All rights reserved.
//

#import "ViewController.h"
#import "VCCell.h"
#import "WCNButton.h"

#import "FSDropDownMenu.h"

@interface ViewController ()<UITableViewDataSource,FSDropDownMenuDataSource,FSDropDownMenuDelegate>

@property(nonatomic,strong) NSArray *cityArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Do any additional setup after loading the view, typically from a nib.
    WCNButton *activityBtn = [[WCNButton alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    activityBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [activityBtn setTitle:@"附近" forState:UIControlStateNormal];
    [activityBtn setImage:[UIImage imageNamed:@"expandableImage"] forState:UIControlStateNormal];
    [activityBtn setBackgroundColor:[UIColor redColor]];
    [activityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [activityBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = activityBtn;
    
   _cityArr = @[@"附近",@"上海",@"北京",@"同城",@"上海",@"北京",@"同城",@"上海",@"北京",@"同城",@"上海",@"北京",@"同城",@"上海",@"北京",@"同城"];

    
    FSDropDownMenu *menu = [[FSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andRowHeight:44.0f andHeight:_cityArr.count*44];
    menu.transformView = activityBtn.imageView;
    menu.tag = 1001;
    menu.dataSource = self;
    menu.delegate = self;
    [self.view addSubview:menu];
    
    UIView *headerView=[UIView new];
    headerView.frame=CGRectMake(0, 0, self.myTableView.frame.size.width, 200);
    [headerView setBackgroundColor:[UIColor redColor]];
    
    self.myTableView.tableHeaderView=headerView;
    
    UIView *footerView = [UIView new];
    footerView.frame=CGRectMake(0, 0, self.myTableView.frame.size.width, 200);
    [footerView setBackgroundColor:[UIColor redColor]];
    self.myTableView.tableFooterView=footerView;
    
    [self.myTableView setBackgroundColor:[UIColor clearColor]];
    [self.view setBackgroundColor:[UIColor blueColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark 
-(void)btnPressed:(id)sender{
    FSDropDownMenu *menu = (FSDropDownMenu*)[self.view viewWithTag:1001];
    [UIView animateWithDuration:0.2 animations:^{
        
    } completion:^(BOOL finished) {
        [menu menuTapped];
    }];
}

#pragma mark -
#pragma mark - FSDropDown datasource & delegate

- (NSInteger)menu:(FSDropDownMenu *)menu tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
 
        return _cityArr.count;
    
}
- (NSString *)menu:(FSDropDownMenu *)menu tableView:(UITableView*)tableView titleForRowAtIndexPath:(NSIndexPath *)indexPath{

        
        return _cityArr[indexPath.row];
  
}


- (void)menu:(FSDropDownMenu *)menu tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
 
        [self resetItemSizeBy:_cityArr[indexPath.row]];

    
}

#pragma mark - reset button size

-(void)resetItemSizeBy:(NSString*)str{
    WCNButton *btn = (WCNButton*)self.navigationItem.titleView;
    [btn setTitle:str forState:UIControlStateNormal];
//    NSDictionary *dict = @{NSFontAttributeName:btn.titleLabel.font};
//    CGSize size = [str boundingRectWithSize:CGSizeMake(150, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
//    btn.frame = CGRectMake(btn.frame.origin.x, btn.frame.origin.y,size.width+33, 30);
//    btn.imageEdgeInsets = UIEdgeInsetsMake(11, size.width+23, 11, 0);
}

#pragma mark -
#pragma mark <#name#>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VCCell *cell=[tableView dequeueReusableCellWithIdentifier:@"VCCell" forIndexPath:indexPath];
    return cell;
}


- (IBAction)toGetData:(id)sender {
    
    for (VCCell *cell in self.myTableView.visibleCells) {
        NSLog(@"cell text is  %@", cell.cTextField.text);
    }
}


@end
