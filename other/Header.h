//
//  Header.h
//  GCChart
//
//  Created by mybook on 16/1/19.
//  Copyright © 2016年 mybook. All rights reserved.
//

//#ifndef Header_h
#define Header_h

#ifdef __OBJC__
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UIImage+GC.h"

// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 2.获得RGB颜色
#define GCColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 3.自定义Log
#ifdef DEBUG
#define GCLog(...) NSLog(__VA_ARGS__)
#else
#define GCLog(...)
#endif


#endif /* Header_h */
