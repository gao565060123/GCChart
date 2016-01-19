//
//  GCTabBarViewController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//
#import "GCTabBarViewController.h"
#import "GCHomeViewController.h"
#import "GCMessageViewController.h"
#import "GCMeViewController.h"
#import "GCDiscoverViewController.h"
#import "GCNavigationController.h"
#import "UIImage+GC.h"
#import "GCTabBar.h"

@interface GCTabBarViewController () <GCTabBarDelegate>
/**
 *  自定义的tabbar
 */
@property (nonatomic, weak) GCTabBar *customTabBar;
@end

@implementation GCTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初始化tabbar
    [self setupTabbar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            
            [child removeFromSuperview];
            
        }
    }
}
/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    GCTabBar *customTabBar = [[GCTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(GCTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    // 1.首页
    GCHomeViewController *home = [[GCHomeViewController alloc] init];
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_profile_os7@2x" selectedImageName:@"tabbar_profile_os7@2x"];
    home.tabBarItem.badgeValue = @"12";
    
    // 2.消息
    GCMessageViewController *message = [[GCMessageViewController alloc] init];
    [self setupChildViewController:message title:@"自选" imageName:@"tabbar_profile_os7@2x" selectedImageName:@"tabbar_profile_os7@2x"];
    
    // 3.广场
    GCDiscoverViewController *discover = [[GCDiscoverViewController alloc] init];
    [self setupChildViewController:discover title:@"发现" imageName:@"tabbar_profile_os7@2x" selectedImageName:@"tabbar_profile_os7@2x"];
    
    // 4.我
    GCMeViewController *me = [[GCMeViewController alloc] init];
    [self setupChildViewController:me title:@"我" imageName:@"tabbar_profile_os7@2x" selectedImageName:@"tabbar_profile_os7@2x"];
}
/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    
    if (iOS7) {
        
        childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    } else {
        
        childVc.tabBarItem.selectedImage = selectedImage;
    
    }
    
    // 2.包装一个导航控制器
    GCNavigationController *nav = [[GCNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}
@end
