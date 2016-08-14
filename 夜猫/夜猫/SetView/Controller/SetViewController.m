//
//  SetViewController.m
//  夜猫
//
//  Created by qingyun on 16/8/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SetViewController.h"
#import "Masonry.h"
#import "SetTableViewCell.h"
#import "SDImageCache.h"

@interface SetViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *arrAddCellModel;

@end

@implementation SetViewController

- (NSArray *)arrAddCellModel {

    if (!_arrAddCellModel) {
        NSString *strPath = [[NSBundle mainBundle] pathForResource:@"setCellList" ofType:@"plist"];
        NSArray *arrModel = [NSArray arrayWithContentsOfFile:strPath];
        NSMutableArray *muArr = [NSMutableArray arrayWithCapacity:arrModel.count];
        for (NSDictionary *dicData in arrModel) {
            SetViewModel *setModel = [SetViewModel modelWithDictionary:dicData];
            [muArr addObject:setModel];
        }
        _arrAddCellModel = [muArr copy];
    }
    return _arrAddCellModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDefaultSetting];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
            [self recommend];
            break;
        case 1:
            [self clear];
            break;
        case 2:
            [self feedback];
            break;
        case 3:
            [self help];
            break;
        case 4:
            [self edition];
            break;
        case 5:
            [self developer];
            break;
        default:
            break;
    }
}

- (void)loadAlert:(NSString *)strTiele describe:(NSString *)strDescribe  {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:strTiele message:strDescribe preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertActionR = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *alertActionL = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:alertActionL];
    [alert addAction:alertActionR];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)recommend {

    [self loadAlert:@"推荐给好友" describe:@"请口头推荐下 感激不尽 QAQ"];
}

- (void)clear {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    CGFloat folderSize;
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:path]) {
        // 拿到有文件的数组
        NSArray *arrChildFiles = [manager subpathsAtPath:path];
        //拿到每个文件的名，不想清除的在这里判断
        for (NSString *fileName in arrChildFiles) {
            // 将路径拼接到一起
            NSString *fullPath = [path stringByAppendingPathComponent:fileName];
            folderSize += [self fileSizeAtPath:fullPath];
        }
        // 给出提示信息
        dispatch_after(0.2, dispatch_get_main_queue(), ^{
            UIAlertController *alertCtr = [UIAlertController alertControllerWithTitle:@"清除缓存" message:[NSString stringWithFormat:@"辛辛苦苦加载的%.2fM 真的要删掉吗?",folderSize] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self removeCacheFileSize];
            }];
            UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            
            [alertCtr addAction:alertAction2];
            [alertCtr addAction:alertAction];
            [self presentViewController:alertCtr animated:YES completion:nil];
        });
    }
}

/** 计算单个文件的大小 */
-(CGFloat)fileSizeAtPath:(NSString *)path {
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:path]) {
        long long size = [manager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}

/** 清除缓存 */
- (void)removeCacheFileSize {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:path]) {
        // 拿到有文件的数组
        NSArray *arrChildFiles = [manager subpathsAtPath:path];
        //拿到每个文件的名，不想清除的在这里判断
        for (NSString *fileName in arrChildFiles) {
            // 将路径拼接到一起
            NSString *fullPath = [path stringByAppendingPathComponent:fileName];
            [manager removeItemAtPath:fullPath error:nil];
        }
    }
}

- (void)feedback {

    [self loadAlert:@"意见反馈" describe:@"暂不支持此功能 敬请期待(每隔一段时间就更新数据 少侠不要心急)"];
}

- (void)help {

    [self loadAlert:@"帮助" describe:@"遇到困难了吗 没有服务器的我并不能帮你什么"];
}

- (void)edition {

    [self loadAlert:@"版本" describe:@"当前就是最新版本 后续敬请期待"];
}

- (void)developer {

    [self loadAlert:@"关于我们" describe:@"IOS新手一个 QQ1113839428"];
}

- (void)loadDefaultSetting {
    
    UITableView *setTableView = [[UITableView alloc] init];
    [self.view addSubview:setTableView];
    [setTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.bottom.equalTo(self.view).offset(-44);
        make.leading.trailing.equalTo(self.view);
    }];
    setTableView.delegate = self;
    setTableView.dataSource = self;
    setTableView.estimatedRowHeight = 60;
    setTableView.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrAddCellModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SetTableViewCell *cell = [SetTableViewCell cellWithTableView:tableView];
    SetViewModel *model = self.arrAddCellModel[indexPath.row];
    cell.setModel = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


@end
