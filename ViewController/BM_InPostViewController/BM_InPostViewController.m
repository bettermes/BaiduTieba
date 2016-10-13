//
//  BM_InPostViewController.m
//  Betterme
//
//  Created by len on 16/9/21.
//  Copyright © 2016年 len. All rights reserved.
//

#import "BM_InPostViewController.h"
#import "BM_InPostTagsView.h"

@interface BM_InPostViewController ()<UIScrollViewDelegate>
{
    BM_InPostTagsView * _tagsView;
}
@end

@implementation BM_InPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBaseView];
}
-(void)loadBaseView{

    self.navigationBarTitleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 46, 0, 0);
    [self.navigationBarTitleBtn setTitle:@"进吧" forState:UIControlStateNormal];
    [self.navigationBarTitleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.autographBtn setImage:[UIImage imageNamed:@"icon_sign_n"] forState:UIControlStateNormal];
    [self.msgBtn setImage:[UIImage imageNamed:@"icon_remind_n"] forState:UIControlStateNormal];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tagsView = [[[NSBundle mainBundle]loadNibNamed:@"BM_InPostTagsView" owner:self options:nil] lastObject];
    _tagsView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 35);
    [self.view addSubview:_tagsView];
    __block BM_InPostViewController * weakSelf = self;
    _tagsView.block = ^(BOOL flag){
        [weakSelf changeContentOffsetWithflag:flag];
    };
    
}

#pragma mark - offset
-(void)changeContentOffsetWithflag:(BOOL)flag{
    if(flag == false){
        self.scrollView.contentOffset = CGPointMake(0, 0);
    }else{
        self.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    }
}

#pragma mark - delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x / SCREEN_WIDTH*1.0;
    //执行TagsView方法
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    if(page == 0){
        button.tag = 1000;
    }else{
        button.tag = 2000;
    }
    _tagsView.flag = 1;
    [_tagsView commonChangeWithSender:button];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
