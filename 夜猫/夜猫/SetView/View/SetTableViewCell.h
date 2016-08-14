//
//  SetViewCell.h
//  夜猫
//
//  Created by qingyun on 16/8/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetViewModel.h"

@interface SetTableViewCell : UITableViewCell

@property (nonatomic, strong) SetViewModel *setModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
