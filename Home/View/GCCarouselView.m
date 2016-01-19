//
//  GCCarouselView.m
//  My_ProText
//
//  Created by mybook on 15/11/19.
//  Copyright © 2015年 mybook. All rights reserved.
//

#import "GCCarouselView.h"

@interface GCCarouselView()// <SDCycleScrollViewDelegate>



@end
@implementation GCCarouselView


+ (SDCycleScrollView *)addCarouselViewWithFrame:(CGRect )frame
{
    SDCycleScrollView *carouselView = [[SDCycleScrollView alloc] init];
    
    //网络地址数组
    NSArray *array = @[@"http://img02.tooopen.com/images/20151029/tooopen_sy_146725312674.jpg",
                                         @"http://img02.tooopen.com/images/20151119/tooopen_sy_148980016711.jpg",
                                         @"http://img02.tooopen.com/images/20151018/tooopen_sy_145686517977.jpg",
                                         @"http://img02.tooopen.com/images/20151018/tooopen_sy_145687288334.jpg"
                       ];
    
    //文字数组
    NSArray *strArr = @[@"大家好",@"哈哈",@"嘻嘻",@"多少分讲啦",@"没男子休产假好久放假啊"];
    
    //实例化一个对象
    carouselView = [SDCycleScrollView cycleScrollViewWithFrame:frame imageURLStringsGroup:array];
    
    //设置需要的属性
    //view2.showPageControl = NO;
    carouselView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    carouselView.autoScrollTimeInterval = 1;
    
//    carouselView.delegate = self;
    
//    carouselView.delegate = delegate;
    

    carouselView.titlesGroup = strArr;
    carouselView.dotColor = [UIColor whiteColor];
    carouselView.titleLabelHeight = 50;
    
    return carouselView;  //  返回轮播视图
}


@end
