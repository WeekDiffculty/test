//
//  ImageViewCell.h
//  夜猫
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHImageCellModel;
@interface ImageViewCell : UITableViewCell

@property (nonatomic, strong) YHImageCellModel *imageModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
