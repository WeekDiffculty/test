//
//  SetViewCell.m
//  夜猫
//
//  Created by qingyun on 16/8/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SetTableViewCell.h"

@interface SetTableViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *benImage;
@property (weak, nonatomic) IBOutlet UILabel *lbText;

@end

@implementation SetTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {

    static NSString *strID = @"SetTableViewCell";
    SetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SetTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)loadDefaultSetting {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self loadDefaultSetting];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setSetModel:(SetViewModel *)setModel {

    _setModel = setModel;
    [self.benImage setImage:[UIImage imageNamed:setModel.strImage] forState:UIControlStateNormal];
    self.lbText.text = setModel.strText;
}

@end
