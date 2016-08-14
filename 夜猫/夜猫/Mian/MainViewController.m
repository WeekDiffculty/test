//
//  ViewController.m
//  夜猫
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "MainViewController.h"
#import "YHTabBar.h"
#import "YHImageViewController.h"
#import "YHTextViewController.h"
#import "SetViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) UIView *logoView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    
    YHTextViewController *taxtView = [YHTextViewController new];
    [self addViewController:taxtView imageName:@"taxtItem" title:@"段子"];
    
    YHImageViewController *imageView = [YHImageViewController new];
    [self addViewController:imageView imageName:@"imageItem" title:@"趣图"];
    
    SetViewController *setView = [SetViewController new];
    [self addViewController:setView imageName:@"setItem" title:@"设置"];
    
    YHTabBar *tabBar = [[YHTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
    self.tabBar.tintColor = [UIColor redColor];
    
    UIView *logoView = [[UIView alloc] init/*WithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)*/];
    logoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:logoView];
    [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.view);
        make.height.mas_equalTo(64);
    }];
    
    UIImageView *logoImage = [[UIImageView alloc] init/*WithFrame:CGRectMake(imageX - 50, 20, 100, 40)*/];
    UIImage *image = [UIImage imageNamed:@"navText"];
    [logoImage setImage:image];
    [logoView addSubview:logoImage];
    CGFloat imageW = 90;
    CGFloat imageX = self.view.frame.size.width / 2 - imageW *0.5;
    [logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(logoView).offset(24);
        make.bottom.equalTo(logoView).offset(-4);
        make.leading.mas_equalTo(imageX);
        make.width.mas_equalTo(imageW);
    }];
}

- (void)addViewController:(UIViewController *)viewController imageName:(NSString *)imageName title:(NSString *)title {
    
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_",imageName]];
    viewController.title = title;
    viewController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    [self addChildViewController:viewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
