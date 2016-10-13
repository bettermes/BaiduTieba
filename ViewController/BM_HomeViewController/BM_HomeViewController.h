//
//  BM_HomeViewController.h
//  Betterme
//
//  Created by len on 16/9/20.
//  Copyright © 2016年 len. All rights reserved.
//

#import "BM_SuperViewController.h"

@interface BM_HomeViewController : BM_SuperViewController
@property (weak, nonatomic) IBOutlet UIScrollView *HScorllView;
@property (weak, nonatomic) IBOutlet UITableView *centerTableView;

@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
@end
