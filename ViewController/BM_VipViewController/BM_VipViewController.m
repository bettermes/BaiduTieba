//
//  BM_VipViewController.m
//  Betterme
//
//  Created by len on 16/9/22.
//  Copyright © 2016年 len. All rights reserved.
//

#import "BM_VipViewController.h"
#import "BM_NavigationBarView.h"

@interface BM_VipViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    //一个类似于头视图的图片
    UIImageView * _firstImageView;
    BM_NavigationBarView * navbar;
}
@end

@implementation BM_VipViewController

-(void)viewWillAppear:(BOOL)animated{
    //隐藏navigationbar
   self.navigationController.navigationBar.hidden = YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -180, self.view.frame.size.width, 155)];
    self.vipTableView.contentInset = UIEdgeInsetsMake(130, 0, 0, 0);
    _firstImageView.image = [UIImage imageNamed:@"pic_vip"];
    
    [self.view addSubview:self.vipTableView];
    [self.vipTableView insertSubview:_firstImageView atIndex:0];
    navbar = [[[NSBundle mainBundle]loadNibNamed:@"BM_NavigationBarView" owner:self options:nil]lastObject];
    navbar.frame = CGRectMake(0, -91, SCREEN_WIDTH, 155);
    [self.view addSubview:navbar];
    navbar.opaque = YES;
    navbar.alpha = 0.02;
    
    UILabel * titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44)];
    titleLab.font = [UIFont boldSystemFontOfSize:18];
    titleLab.textColor = [UIColor whiteColor];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.text = @"会员中心";
    [self.view addSubview:titleLab];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    //tableView下拉，根据偏移量计算出下拉的高度
    CGFloat downHeight = -scrollView.contentOffset.y - 75;
    if(downHeight <= 0){
        navbar.alpha = 1;
    }else{
        navbar.alpha = 0;

    }
    NSLog(@"%f" , downHeight);
    if(downHeight > 55){
         _firstImageView.bounds = CGRectMake(0, 0,(downHeight/155.0+1) *SCREEN_WIDTH, ( downHeight/155.0+1)*155);
        navbar.alpha = downHeight/320.0/7.0;
    }
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[[NSBundle mainBundle]loadNibNamed:@"BM_VipHeaderView" owner:self options:nil]lastObject];
    view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
    
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 60;
    }
    return 0;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 1){
        return 0;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fsaf"];
    return cell;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
