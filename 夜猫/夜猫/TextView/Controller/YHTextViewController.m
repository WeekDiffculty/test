//
//  YHTextViewController.m
//  夜猫
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "YHTextViewController.h"
#import "TextViewCell.h"
#import "YHTextCellModel.h"
#import "AFNetworking.h"
#import "Masonry.h"

#define Server_Gengciyuan_Url_Last @"http://s.budejie.com/topic/tag-topic/64/hot/budejie-android-6.4.9/0-20.json?market=xiaomi&ver=6.4.9&visiting=18841226&os=5.0.2&appname=baisibudejie&client=android&udid=862620024817290&mac=f8%3Aa4%3A5f%3A1e%3Aa0%3Afb"

@interface YHTextViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *textTableView;
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) YHTextCellModel *textModel;
@property (nonatomic, strong) NSMutableArray *muArrModel;

@end

@implementation YHTextViewController

- (NSMutableArray *)muArrModel {
    
    if (_muArrModel == nil) {
        _muArrModel = [NSMutableArray array];
    }
    return _muArrModel;
}

- (AFHTTPSessionManager *)manager {
    
    if (_manager) {
        return _manager;
    }
    _manager = [AFHTTPSessionManager manager];
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
}

- (void)requestData {
    
    [self.manager GET:Server_Gengciyuan_Url_Last parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *arrData = responseObject[@"list"];
        NSMutableArray *arrMTemp = [NSMutableArray array];
        for (NSDictionary *dicData in arrData) {
            YHTextCellModel *textModel = [YHTextCellModel modelWithDictionary:dicData];
            self.textModel = textModel;
            [arrMTemp addObject:textModel];
        }
        _muArrModel = [arrMTemp copy];
        [self loadDefaultSetting];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)loadDefaultSetting {
    
    UITableView *textTableView = [[UITableView alloc] init];
    [self.view addSubview:textTableView];
    [textTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.bottom.equalTo(self.view).offset(-44);
        make.leading.trailing.equalTo(self.view);
    }];
    textTableView.delegate = self;
    textTableView.dataSource = self;
    textTableView.estimatedRowHeight = 100;
    textTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.textTableView = textTableView;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.muArrModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextViewCell *cell = [TextViewCell cellWithTableView:tableView];
    cell.textModel = self.muArrModel[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
