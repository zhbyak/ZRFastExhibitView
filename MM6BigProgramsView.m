//
//  MM6BigProgramsView.m
//  MobileMovies
//
//  Created by 中投视讯 on 16/1/5.
//  Copyright © 2016年 中投视讯. All rights reserved.
//

#import "MM6BigProgramsView.h"
#import "UIImageView+WebCache.h"

@interface  MM6BigProgramsView()

//大标题
@property (weak, nonatomic) IBOutlet UILabel *mainTitle;

//-----------------影片view-----------------//
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *images;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *movieTypeImages;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *titles;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *subTitles;

//标记用
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end


@implementation MM6BigProgramsView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)awakeFromNib{
    
    self.frame = CGRectMake(0, 0, KScreenWidth, 100);
    //这个方法很重要 立即重新布局 别的方法都没用 就他可以
    [self layoutIfNeeded];
    //获取到自己的subviews的最下面的view 用他的maxY就是这个view的高度 加上margin = 5
    self.frame = CGRectMake(0, 0, KScreenWidth, self.bottomView.maxY + 5);
    
    
    
    
    
}

- (void)setBlockListContent:(MMBlockListContent *)blockListContent{
    _blockListContent = blockListContent;
    
    self.mainTitle.text = blockListContent.title;
    
    NSArray *programs = blockListContent.programs;
    
    for (int i = 0 ; i < 6; i ++) {
        [self.images[i] sd_setImageWithURL:[NSURL URLWithString:[programs[i] img]] placeholderImage:[UIImage imageNamed:@"推荐图_电影海报_未加载"]];
        
        [self.titles[i] setText:[programs[i] title]];
        [self.subTitles[i] setText:[programs[i] subTitle]];
        
    }
    
    
    
}



@end
