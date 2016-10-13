//
//  BM_InPostTagsView.m
//  Betterme
//
//  Created by len on 16/9/21.
//  Copyright © 2016年 len. All rights reserved.
//

#import "BM_InPostTagsView.h"

@implementation BM_InPostTagsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)myAndIntroBtnClicked:(id)sender {
    UIButton * button = (UIButton *)sender;
    if(button.tag == 1000){
        self.block(0);
    }else{
        self.block(1);
    }
    [self commonChangeWithSender:sender];
}

-(void)commonChangeWithSender:(id)sender{
    UIButton * button = (UIButton *)sender;
    CGFloat floatW = 0;
    if(button.tag == 1000){
        //第一个
        floatW = 0;
        [self.myBarBtn setTitleColor:[UIColor colorWithRed:90/255.0 green:116/255.0 blue:240/255.0 alpha:1] forState:UIControlStateNormal];
        [self.introBarBtn setTitleColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1] forState:UIControlStateNormal];
        self.myBarBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        self.introBarBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
    }else{
        //第二个
        floatW = SCREEN_WIDTH/2.0;
        [self.myBarBtn setTitleColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1] forState:UIControlStateNormal];
        [self.introBarBtn setTitleColor:[UIColor colorWithRed:90/255.0 green:116/255.0 blue:240/255.0 alpha:1] forState:UIControlStateNormal];
        self.myBarBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        self.introBarBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.leadingW.constant = floatW;
    }];
}
@end
