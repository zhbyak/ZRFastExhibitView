//
//  MMMainExhibitView.m
//  MobileMovies
//
//  Created by 中投视讯 on 16/1/4.
//  Copyright © 2016年 中投视讯. All rights reserved.
//

#import "MMMainExhibitView.h"
#import "MMMainHeaderView.h"
#import "MM6ProgramsView.h"
#import "MM6BigProgramsView.h"

#define cellReuseTag 555

@interface MMMainExhibitView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;

//根据数据源获取所有的view
@property (nonatomic,strong) NSMutableArray *viewArray;


@end



@implementation MMMainExhibitView


static NSString * reuseID = @"Header";




- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self initViews];

    }

    return self;
}

- (void)initViews{
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseID];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

}

- (void)setMainModel:(MMMainModel *)mainModel{

    _mainModel = mainModel;
    
    [self updateViewsAndData];

    //保险
//    [self.collectionView reloadData];
}

/*
 在这里进行任何的view的创建和顺序添加 跟整个collectionView已经无关
 */
- (void)updateViewsAndData{
    
    self.viewArray = [NSMutableArray array];
    
    //先添加头
    MMMainHeaderView *mainHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"MMMainHeaderView" owner:nil options:nil] lastObject];
    mainHeaderView.mainModel = self.mainModel;
    [self.viewArray addObject:mainHeaderView];
    
    //再添加marquee
    
    
    //再添加blockList,进行判断
    for (MMBlockListContent *content in self.mainModel.blockList) {
        
        if ([content.title isEqualToString:@"精彩推荐"]) {
            
            MM6ProgramsView *programsView = [[[NSBundle mainBundle] loadNibNamed:@"MM6ProgramsView" owner:nil options:nil] firstObject];
            
            programsView.blockListContent = content;
            
            [self.viewArray addObject:programsView];
            
        }
        
        if ([content.title isEqualToString:@"专题策划"]) {
            
            MM6ProgramsView *programsView = [[[NSBundle mainBundle] loadNibNamed:@"MM6ProgramsView" owner:nil options:nil] firstObject];
            
            programsView.blockListContent = content;
            
            [self.viewArray addObject:programsView];
            
        }
        
        if ([content.title isEqualToString:@"好莱坞"]) {
            
            MM6ProgramsView *programsView = [[[NSBundle mainBundle] loadNibNamed:@"MM7ProgramsView" owner:nil options:nil] firstObject];
            
            programsView.blockListContent = content;
            
            [self.viewArray addObject:programsView];
            
        }
        
        if ([content.title isEqualToString:@"日韩精选"]) {
            
            MM6ProgramsView *programsView = [[[NSBundle mainBundle] loadNibNamed:@"MM7ProgramsView" owner:nil options:nil] firstObject];
            
            programsView.blockListContent = content;
            
            [self.viewArray addObject:programsView];
            
        }
        
        if ([content.title isEqualToString:@"大咖剧场"]) {
            
            MM6ProgramsView *programsView = [[[NSBundle mainBundle] loadNibNamed:@"MM7ProgramsView" owner:nil options:nil] firstObject];
            
            programsView.blockListContent = content;
            
            [self.viewArray addObject:programsView];
            
        }
        
        if ([content.title isEqualToString:@"午夜剧场"]) {
            
            MM6ProgramsView *programsView = [[[NSBundle mainBundle] loadNibNamed:@"MM7ProgramsView" owner:nil options:nil] firstObject];
            
            programsView.blockListContent = content;
            
            [self.viewArray addObject:programsView];
            
        }
        
        if ([content.title isEqualToString:@"微电影"]) {
            
            MM6BigProgramsView *programsView = [[[NSBundle mainBundle] loadNibNamed:@"MM6BigProgramsView" owner:nil options:nil] firstObject];
            
            programsView.blockListContent = content;
            
            [self.viewArray addObject:programsView];
            
        }
        
        if ([content.title isEqualToString:@"最新动态"]) {
            
           
            
        }
        
        if ([content.title isEqualToString:@"微票儿"]) {
            
            
            
        }
        
        if ([content.title isEqualToString:@"CIBN电影频道"]) {
            
            
            
        }
        
        if ([content.title isEqualToString:@"直播专区"]) {
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.viewArray.count;

}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];

    
    //进行重用判断
    if ([cell viewWithTag:cellReuseTag]) {
        [[cell viewWithTag:cellReuseTag] removeFromSuperview];
    }
    
    //创建一个包裹view用于识别
    UIView *contentView = [UIView new];
    contentView.tag = cellReuseTag;
    
    //添加内容的view
    contentView.frame = [self.viewArray[indexPath.item] frame];
    [contentView addSubview:self.viewArray[indexPath.item]];
    
    cell.backgroundColor = [UIColor purpleColor];
    
    [cell addSubview:contentView];
    
    

    return cell;
    
}




#pragma mark - UICollectionViewDelegate
//每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

//    CGSize size = CGSizeMake(KScreenWidth, [self.heightArray[indexPath.item] floatValue]);
    UIView *view = self.viewArray[indexPath.item];
    
    
    return view.frame.size;
}

//设置每组的cell的边界, 具体看下图
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsZero;
}

//cell的最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

//cell的最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}




#pragma mark - 懒加载
- (UICollectionView *)collectionView{
    
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        [self addSubview:_collectionView];
    }

    return _collectionView;
}
@end
