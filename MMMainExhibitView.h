//
//  MMMainExhibitView.h
//  MobileMovies
//
//  Created by 中投视讯 on 16/1/4.
//  Copyright © 2016年 中投视讯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMMainModel.h"

@interface MMMainExhibitView : UIView

@property (nonatomic,strong) MMMainModel *mainModel;

@property (nonatomic,weak) UIViewController *superViewController;
@end
