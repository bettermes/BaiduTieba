//
//  BM_InPostTagsView.h
//  Betterme
//
//  Created by len on 16/9/21.
//  Copyright © 2016年 len. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ChangePageDelegate)(BOOL flag);
@interface BM_InPostTagsView : UIView
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingW;
@property (weak, nonatomic) IBOutlet UIButton *myBarBtn;
@property (weak, nonatomic) IBOutlet UIButton *introBarBtn;
@property (nonatomic,copy)ChangePageDelegate block;
- (IBAction)myAndIntroBtnClicked:(id)sender;
@property (nonatomic,assign)NSInteger flag;
-(void)commonChangeWithSender:(id)sender;
@end
