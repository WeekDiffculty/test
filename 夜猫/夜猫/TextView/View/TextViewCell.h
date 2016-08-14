//
//  TextViewCell.h
//  夜猫
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHTextCellModel;

@interface TextViewCell : UITableViewCell

@property (nonatomic, strong) YHTextCellModel *textModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
