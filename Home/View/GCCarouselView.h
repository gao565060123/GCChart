//
//  GCCarouselView.h
//  My_ProText
//
//  Created by mybook on 15/11/19.
//  Copyright © 2015年 mybook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
@interface GCCarouselView : UIView

//@property (nonatomic, strong) SDCycleScrollView *carouselView; // 轮播视图

//@property (nonatomic, strong) id<SDCycleScrollViewDelegate>  delegate;




+ (SDCycleScrollView *)addCarouselViewWithFrame:(CGRect )frame;
//+ (SDCycleScrollView *)addCarouselViewWithFrame:(CGRect )frame andDelegate:(id) delegate;

@end
