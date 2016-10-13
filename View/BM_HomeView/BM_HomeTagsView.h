//
//  BM_HomeTagsView.h
//  Betterme
//
//  Created by len on 16/9/20.
//  Copyright © 2016年 len. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ChangetagsAndLinesBolck)(NSInteger olddata, NSInteger resultdata);

@interface BM_HomeTagsView : UIView
@property (weak, nonatomic) IBOutlet UICollectionView *tagsConnectionView;
@property (nonatomic,copy) ChangetagsAndLinesBolck changeBlock;
-(void)changeTagsAndLinesViewPositionWithIndexPath:(NSIndexPath *)indexPath;
@end
