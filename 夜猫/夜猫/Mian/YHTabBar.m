//
//  YHTabBar.m
//  梗次元
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "YHTabBar.h"

@implementation YHTabBar



- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self loadDefaultSetting];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        [self loadDefaultSetting];
    }
    return self;
}

- (void)loadDefaultSetting {
    //   (ง •̀_•́)ง
}

// 布局子视图时会调用的方法  这个方法会多次调用
- (void)layoutSubviews {

    [super layoutSubviews];
    
//    /**  遍历所有子视图  */
//    NSArray *arrViews = self.subviews;
//    NSUInteger count = arrViews.count;
//    NSMutableArray *muArr = [NSMutableArray arrayWithCapacity:count];
//    for (NSInteger index = 0; index < count; index += 1) {
//        UIView *view = arrViews[index];
//        Class classView = NSClassFromString(@"UITabBarButton");
//        if ([view isKindOfClass:classView]) {
//            [muArr addObject:view];
//        }
//    }
//    
//    /**  布局tabbarButton  */
//    NSUInteger itemCount = muArr.count;
//    CGFloat itemW = self.frame.size.width / count;
//    CGFloat itemH = self.frame.size.height;
//    for (NSInteger index = 0; index < itemCount; index += 1) {
//        CGFloat itemX = 0;
//        itemX = itemW * index;
//        UIView *view = muArr[index];
//        view.backgroundColor = [UIColor orangeColor];
//        view.frame = CGRectMake(itemX, 0, itemW, itemH);
//    }
    
}

@end
