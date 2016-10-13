//
//  BM_HomeViewController.m
//  Betterme
//
//  Created by len on 16/9/20.
//  Copyright © 2016年 len. All rights reserved.
//

#import "BM_HomeViewController.h"
#import "BM_HomeTagsView.h"
#import "BM_HomeThreePhotoTableViewCell.h"
#import "BM_HomeOneTableViewCell.h"
#import "BM_HomeTwoTableViewCell.h"

@interface BM_HomeViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    BM_HomeTagsView * _tagsView;
    UIView * screenBgView;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *HScrollViewWidth;

@end

@implementation BM_HomeViewController

-(void)viewWillAppear:(BOOL)animated{
    
}

-(void)startAnimationLaunchScreen{
    screenBgView = [[[NSBundle mainBundle]loadNibNamed:@"LaunchScreenBgView" owner:self options:nil]lastObject];
    screenBgView.frame = [UIScreen mainScreen].bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:screenBgView];
    
    UIImageView * imageV = [screenBgView.subviews lastObject];
    
    imageV.animationImages = [self getImagesArr];
    //为动画设置持续时间
    imageV.animationDuration = 1.0;
    //为默认的无限循环
    imageV.animationRepeatCount = 1;
    //开始播放动画
    [imageV startAnimating];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [screenBgView removeFromSuperview];
    });

}
-(NSArray *)getImagesArr{
    NSMutableArray * imagesArr = [[NSMutableArray alloc]init];
    for(int i = 1;i< 25;i++){
        
        [imagesArr addObject: [UIImage imageNamed:[NSString stringWithFormat:@"qidong－%d（被拖移）.png",i]]];
    }
    return imagesArr;
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    self.HScrollViewWidth.constant = SCREEN_WIDTH * 3;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startAnimationLaunchScreen];
    // Do any additional setup after loading the view.
    //初始化
    [self loadBaseView];
    [self initHomeTagsView];
    [self initTableViewBases];
}
-(void)loadBaseView{
    [self.navigationBarTitleBtn setImage:[UIImage imageNamed:@"icon_home_logo"] forState:UIControlStateNormal];
    [self.autographBtn setImage:[UIImage imageNamed:@"icon_search_n"] forState:UIControlStateNormal];
    [self.msgBtn setImage:[UIImage imageNamed:@"icon_remind_n"] forState:UIControlStateNormal];
    self.automaticallyAdjustsScrollViewInsets = NO;
}



-(void)initHomeTagsView{
    
    _tagsView = [[BM_HomeTagsView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 35)];
    [self.view addSubview:_tagsView];
    self.HScorllView.contentSize = CGSizeMake(SCREEN_WIDTH*3, SCREEN_HEIGHT-99);
    self.HScorllView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    __weak BM_HomeViewController * weakSelf = self;
    _tagsView.changeBlock =^(NSInteger oldIndex,NSInteger newIndex ){
        CGFloat reFloat;
        if(oldIndex > newIndex){
            weakSelf.HScorllView.contentOffset = CGPointMake(0, 0);
        }else if (oldIndex < newIndex){
            reFloat = SCREEN_WIDTH;
            weakSelf.HScorllView.contentOffset = CGPointMake(2* SCREEN_WIDTH, 0);
        }
       // [weakSelf changeTableViewPositionWithFlag:0];
    };
}
//交换tableView的位置
-(void)changeTableViewPositionWithFlag:(BOOL)flag{
    CGRect rect  = self.centerTableView.frame;
    CGRect rect2 = self.centerTableView.frame;
    CGRect rect3 = self.centerTableView.frame;
    if(flag == 0){//向左滑
        rect.origin.x = rect.origin.x - SCREEN_WIDTH;
        rect3.origin.x = rect.origin.x + SCREEN_WIDTH;
    }else if (flag == 1){//向右滑
    
    }
    self.centerTableView.frame = rect3;
    self.leftTableView.frame = rect2;
    self.rightTableView.frame = rect;
    
}
#pragma mark - delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x / SCREEN_WIDTH*1.0;
    //执行TagsView方法
    [_tagsView changeTagsAndLinesViewPositionWithIndexPath: [NSIndexPath indexPathForRow:page inSection:0]];
  
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
   // self.HScorllView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
}
-(void)initTableViewBases{
    self.centerTableView.tableFooterView = [[UIView alloc]init];
    self.centerTableView.bounces = NO;
    [self.centerTableView registerNib:[UINib nibWithNibName:@"BM_HomeThreePhotoTableViewCell" bundle:nil] forCellReuseIdentifier:@"threephotos"];
    [self.centerTableView registerNib:[UINib nibWithNibName:@"BM_HomeOneTableViewCell" bundle:nil] forCellReuseIdentifier:@"onephotos"];
     [self.centerTableView registerNib:[UINib nibWithNibName:@"BM_HomeTwoTableViewCell" bundle:nil] forCellReuseIdentifier:@"twophotos"];
}

#pragma mark - tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row % 3 == 0 ){
        BM_HomeThreePhotoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"threephotos"];
        return cell;
    }else if(indexPath.row % 3 == 1){
        BM_HomeOneTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"onephotos"];
        return cell;
    }else{
        BM_HomeOneTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"twophotos"];
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row % 3 == 0 ){
        return 180;
    }else if (indexPath.row % 3 == 1){
        return 100;
    }
    return 110;
}
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleDefault;
//}
@end
