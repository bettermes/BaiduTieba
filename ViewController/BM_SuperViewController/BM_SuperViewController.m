//
//  BM_SuperViewController.m
//  Betterme
//
//  Created by len on 16/9/20.
//  Copyright © 2016年 len. All rights reserved.
//

#import "BM_SuperViewController.h"

@interface BM_SuperViewController ()

@end

@implementation BM_SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSuperBaseView];
    // Do any additional setup after loading the view.
}

-(void)loadSuperBaseView{
    [self initNaviogationTitleBtn];
    [self initAutograph];
    [self initMsgBtn];
}
//loadBase
-(void)initNaviogationTitleBtn{
    
    if(!_navigationBarTitleBtn){
        _navigationBarTitleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _navigationBarTitleBtn.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint * constraintX = [NSLayoutConstraint constraintWithItem:_navigationBarTitleBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.navigationController.navigationBar attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        NSLayoutConstraint * constraintY = [NSLayoutConstraint constraintWithItem:_navigationBarTitleBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.navigationController.navigationBar attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        NSLayoutConstraint * constrainW = [NSLayoutConstraint constraintWithItem:_navigationBarTitleBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:46];
        NSLayoutConstraint * constrainH = [NSLayoutConstraint constraintWithItem:_navigationBarTitleBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:23];
        _navigationBarTitleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 11);
        [self.navigationController.navigationBar addSubview:_navigationBarTitleBtn];
        [self.navigationController.navigationBar addConstraints:@[constraintX,constraintY,constrainH,constrainW]];
    }
}

-(void)initMsgBtn{
    if(!_msgBtn){
        _msgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _msgBtn.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint * constraintL = [NSLayoutConstraint constraintWithItem:_msgBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_autographBtn attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
        NSLayoutConstraint * constraintY = [NSLayoutConstraint constraintWithItem:_msgBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.navigationController.navigationBar attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        NSLayoutConstraint * constrainW = [NSLayoutConstraint constraintWithItem:_msgBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
        NSLayoutConstraint * constrainH = [NSLayoutConstraint constraintWithItem:_msgBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
        _msgBtn.imageEdgeInsets = UIEdgeInsetsMake(5, 6, 7, 6);
        [self.navigationController.navigationBar addSubview:_msgBtn];
        [self.navigationController.navigationBar addConstraints:@[constraintL,constraintY,constrainH,constrainW]];
    }
}
-(void)initAutograph{
    if(!_autographBtn){
        _autographBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _autographBtn.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint * constraintL = [NSLayoutConstraint constraintWithItem:_autographBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.navigationController.navigationBar attribute:NSLayoutAttributeRight multiplier:1 constant:-5];
        NSLayoutConstraint * constraintY = [NSLayoutConstraint constraintWithItem:_autographBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.navigationController.navigationBar attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        NSLayoutConstraint * constrainW = [NSLayoutConstraint constraintWithItem:_autographBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
        NSLayoutConstraint * constrainH = [NSLayoutConstraint constraintWithItem:_autographBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
        _autographBtn.imageEdgeInsets = UIEdgeInsetsMake(6, 6, 6, 6);
        [self.navigationController.navigationBar addSubview:_autographBtn];
        [self.navigationController.navigationBar addConstraints:@[constraintL,constraintY,constrainH,constrainW]];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
