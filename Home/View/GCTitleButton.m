//
//  GCTitleButton.m
//  ItcastWeibo
//
//  Created by apple on 14-5-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "GCTitleButton.h"
#import "UIImage+GC.h"

#define GCTitleButtonImageW 20

@implementation GCTitleButton

+ (instancetype)titleButton
{
    return [[self alloc] init];
}

// 重写内部固定的代码
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 高亮的时候不要自动调整图标
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:19];// 文字大小
        self.imageView.contentMode = UIViewContentModeCenter;// 图片居中
        self.titleLabel.textAlignment = NSTextAlignmentRight;// 文字位置
        // 背景
        [self setBackgroundImage:[UIImage resizedImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted]; // 背景图
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal]; // 文字颜色
    }
    return self;
}

// 设置按钮内部的图片frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = GCTitleButtonImageW;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

// 设置按钮内部文字的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = 0;
    CGFloat titleW = contentRect.size.width - GCTitleButtonImageW;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
