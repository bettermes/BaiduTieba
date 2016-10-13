//
//  BM_HomeTagsView.m
//  Betterme
//
//  Created by len on 16/9/20.
//  Copyright © 2016年 len. All rights reserved.
//

#import "BM_HomeTagsView.h"
#import "BM_tagsCollectionViewCell.h"

#define DISTANCE 0 //相隔20
#define ITEM_NUM 4 //一行Item有几个

@interface BM_HomeTagsView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

{
    NSArray * _dataArray;
    UIView * _lineView;
    NSInteger _selectIndex;
    CGFloat _moveFloat;
}
@property (nonatomic ,strong)UICollectionView * myCollectionView;
@end
@implementation BM_HomeTagsView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self configUI];
        [self registNotification];
    }
    return self;
}
//注册通知
-(void)registNotification{
  [_myCollectionView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    if (object == _myCollectionView && [keyPath isEqualToString:@"contentOffset"]) {
        NSLog(@"改变了%@",[change[@"new"] superclass]);
        NSValue *va = change[@"new"];
        NSLog(@"%lf",va.CGPointValue.x);
        _moveFloat = va.CGPointValue.x;
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
//初始化视图
-(void)configUI{
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowLayout];
    self.myCollectionView.backgroundColor = [UIColor clearColor];
    self.myCollectionView.dataSource = self;
    self.myCollectionView.showsHorizontalScrollIndicator = NO;
    self.myCollectionView.delegate = self;
    [self addSubview:_myCollectionView];
    [self.myCollectionView registerNib:[UINib nibWithNibName:@"BM_tagsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"faceCell"];
    [self loadData];
    UIView * sep_1 = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-0.5, SCREEN_WIDTH, 0.5)];
    sep_1.backgroundColor = [UIColor blackColor];
    sep_1.alpha = 0.3;
    [self addSubview:sep_1];

    _lineView = [[UIView alloc]init];
    _lineView.backgroundColor = [UIColor blueColor];
    [self addSubview:_lineView];
    _lineView.hidden = YES;
}

-(void)loadData{
     _dataArray = @[@"推荐",@"我的大神",@"视频",@"热议",@"访谈",@"推荐",@"我的大神",@"视频",@"热议",@"访谈"];
    [self.myCollectionView reloadData];
}

#pragma mark - delagate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BM_tagsCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"faceCell" forIndexPath:indexPath];
    cell.tagLabel.text = _dataArray[indexPath.row];
    if(_selectIndex == indexPath.row){
        _lineView.frame = CGRectMake(cell.frame.origin.x + (cell.frame.size.width - 15)/2.0, 33, 15, 2);
      //  [cell.contentView addSubview:_lineView];
        cell.lineView.hidden = NO;
        cell.tagLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.tagLabel.textColor = [UIColor colorWithRed:90/255.0 green:116/255.0 blue:240/255.0 alpha:1];
    }
    else{
    cell.tagLabel.font = [UIFont systemFontOfSize:14];
        cell.tagLabel.textColor = [UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1];
        cell.lineView.hidden = YES;
    }
     return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
return CGSizeMake([self getCGSizeWithString:_dataArray[indexPath.row] AndFont:[UIFont boldSystemFontOfSize:14]].width+15, 35);
}

//选中
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中了%ld",indexPath.row);
    __weak BM_HomeTagsView *weakSelf = self;
    weakSelf.changeBlock(_selectIndex, indexPath.row);
    [self changeTagsAndLinesViewPositionWithIndexPath:indexPath];
    
}
#pragma mark - common
-(void)changeTagsAndLinesViewPositionWithIndexPath:(NSIndexPath *)indexPath{
    _lineView.hidden = NO;
    BM_tagsCollectionViewCell *cell = (BM_tagsCollectionViewCell *)[self.myCollectionView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:0.2 animations:^{
        _lineView.frame = CGRectMake(cell.frame.origin.x + (cell.frame.size.width - 15)/2.0 , 33, 15, 2);
    }];
    NSIndexPath * indexP = nil;
    if( (_dataArray.count - indexPath.row) > 3 && indexPath.row>2){
        indexP = [NSIndexPath indexPathForRow:indexPath.row + 2 inSection:indexPath.section];
    }
    [self.myCollectionView scrollToItemAtIndexPath:indexP atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    //得到 line位于父视图的frame
    BM_tagsCollectionViewCell *oldCell = (BM_tagsCollectionViewCell *)[self.myCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:_selectIndex inSection:indexPath.section]];
    oldCell.lineView.hidden = YES;
    CGRect oldRect = _lineView.frame;
    oldRect.origin.x = oldCell.frame.origin.x - _moveFloat +  (oldCell.frame.size.width - 15)/2.0;
    oldRect.origin.y = oldCell.frame.origin.y + 33;
    _lineView.frame = oldRect;
    CGRect nowRect = _lineView.frame;
    nowRect.origin.x = cell.frame.origin.x - _moveFloat + (cell.frame.size.width - 15)/2.0;
    nowRect.origin.y = cell.frame.origin.y + 33;
    
    [UIView animateWithDuration:0.2 animations:^{
        _lineView.frame = nowRect;
    } completion:^(BOOL finished) {
        _lineView.hidden = YES;
        [self.myCollectionView reloadData];
    }];
    _selectIndex = indexPath.row;
}
-(CGSize)getCGSizeWithString:(NSString *)string AndFont:(UIFont *)font{
    return [string sizeWithAttributes:@{@"NSFontAttributeName" : font}];
   // return  [string sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 30)];
    
}
#pragma mark － 暂时不用
//设置边缘
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(DISTANCE,DISTANCE, DISTANCE, DISTANCE);
}
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 5;
//}
@end
