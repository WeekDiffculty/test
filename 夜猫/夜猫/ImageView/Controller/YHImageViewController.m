//
//  YHImageViewController.m
//  夜猫
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "YHImageViewController.h"
#import "ImageViewCell.h"
#import "AFNetworking.h"
#import "YHImageCellModel.h"
#define Server_Gengciyuan_Url_Last @"http://s.budejie.com/topic/list/zuixin/10/budejie-android-6.4.9/0-20.json?market=xiaomi&ver=6.4.9&visiting=18841226&os=5.0.2&appname=baisibudejie&client=android&udid=862620024817290&mac=f8%3Aa4%3A5f%3A1e%3Aa0%3Afb"

@interface YHImageViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *imageTableView;
@property (nonatomic, strong) NSMutableArray *muArrModel;
@property (nonatomic, strong) YHImageCellModel *imageModel;
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation YHImageViewController

-(AFHTTPSessionManager *)manager {

    if (_manager) {
        return _manager;
    }
    _manager = [AFHTTPSessionManager manager];
    return _manager;
}

- (NSMutableArray *)muArrModel {

    if (_muArrModel == nil) {
        _muArrModel = [NSMutableArray array];
    }
    return _muArrModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
}

- (void)requestData {
    
    dispatch_queue_t queue1 =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue1, ^{
        [self.manager GET:Server_Gengciyuan_Url_Last parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSArray *arrData = responseObject[@"list"];
            NSMutableArray *arrMTemp = [NSMutableArray array];
            for (NSDictionary *dicData in arrData) {
                YHImageCellModel *imageModel = [YHImageCellModel modelWithDictionary:dicData];
                self.imageModel = imageModel;
                [arrMTemp addObject:imageModel];
            }
            _muArrModel = [arrMTemp copy];
            dispatch_queue_t queue2 =dispatch_get_main_queue();
            
            dispatch_async(queue2, ^(void){
                [self loadDefaultSetting];

            });
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    });
    
}

- (void)loadDefaultSetting {
    
    UITableView *imageTableView = [[UITableView alloc] init/*WithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)*/];
    [self.view addSubview:imageTableView];
    [imageTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.bottom.equalTo(self.view).offset(-44);
        make.leading.trailing.equalTo(self.view);
    }];
    imageTableView.delegate = self;
    imageTableView.dataSource = self;
    imageTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    imageTableView.estimatedRowHeight = 100;
    self.imageTableView = imageTableView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    YHImageCellModel * model = self.muArrModel[indexPath.row];

    return model.rowH;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.muArrModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageViewCell *cell = [ImageViewCell cellWithTableView:tableView];
    cell.imageModel = self.muArrModel[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


@end
