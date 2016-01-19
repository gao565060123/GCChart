//
//  GCHomeViewController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "GCHomeViewController.h"
#import "GCBadgeButton.h"
#import "UIBarButtonItem+GC.h"
#import "GCTitleButton.h"
#import "GCCarouselView.h"

#define GCTitleButtonDownTag 0
#define GCTitleButtonUpTag -1

@interface GCHomeViewController ()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) SDCycleScrollView *carouselView;


@end

@implementation GCHomeViewController

#pragma mark 懒加载轮播
- (SDCycleScrollView *)carouselView
{
    if (!_carouselView) {
        _carouselView = [GCCarouselView addCarouselViewWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
        _carouselView.delegate = self;
    }
       return _carouselView;
}
#pragma mark-点击事件处理  ------跳转广告页

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    NSLog(@"点击----%ld",(long)index);
    //    LZZSettingController *setVC = [[LZZSettingController alloc] init];
    //
    //    [self.navigationController pushViewController:setVC animated:YES];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.tabBarItem.badgeValue = @"12";
    //----------------------------------------------------------------------------------------------------------------------------------------------
    // 导航栏按钮
    // 左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"tabbar_profile_os7@2x" highIcon:@"tabbar_profile_os7@2x" target:self action:@selector(findFriend)];
    
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"tabbar_profile_os7@2x" highIcon:@"tabbar_profile_os7@2x" target:self action:@selector(pop)];
    //----------------------------------------------------------------------------------------------------------------------------------------------
    
    // 中间按钮
    GCTitleButton *titleButton = [GCTitleButton titleButton];
    // 图标
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    // 文字
    [titleButton setTitle:@"大综商品" forState:UIControlStateNormal];
    // 位置和尺寸
    titleButton.frame = CGRectMake(0, 0, 100, 40);
//    titleButton.tag = GCTitleButtonDownTag;
    titleButton.selected = NO;
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleButton;
    
}
// 点击按钮翻转图片
- (void)titleClick:(GCTitleButton *)titleButton
{
    // 3--------------- selected
    if (titleButton.selected) {
             [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        titleButton.selected = NO;
    }else {
          [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
        titleButton.selected = YES;

    }
    
    //   1-------------    tag
//    if (titleButton.tag == -1) {
//        [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
//        titleButton.tag = GCTitleButtonDownTag;
//    }else{
//        [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
//        titleButton.tag = GCTitleButtonUpTag;
//    }
    
    
    
    
       //   2-------------  图片缓存
//    if (titleButton.currentImage == [UIImage imageWithName:@"navigationbar_arrow_up" ]) {
//        
//        [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
//        titleButton.tag = GCTitleButtonDownTag;
//    } else {
//        [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
//        titleButton.tag = GCTitleButtonUpTag;
//    }
}

- (void)findFriend
{
    GCLog(@"navigation");
}

- (void)pop
{
    GCLog(@"pop");
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 1;
    }else if(section == 1){
    
        return 1;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    // 2.设置cell的数据
    cell.textLabel.text = @"财富中心";
    if (indexPath.section == 0) {
//        cell.contentView = 
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return 200;
    }else if (indexPath.section == 1){
    
        return 80;
    }else{
    
        return 155;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);
{
    return YES;
}





@end
























