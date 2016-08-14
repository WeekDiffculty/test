//
//  TextViewCell.m
//  夜猫
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "TextViewCell.h"
#import "YHTextCellModel.h"
#import "UIButton+WebCache.h"

@interface TextViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *textName;
@property (weak, nonatomic) IBOutlet UILabel *textTime;
@property (weak, nonatomic) IBOutlet UILabel *textLb;
@property (weak, nonatomic) IBOutlet UIButton *title;

@end

@implementation TextViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self= [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.title.layer.cornerRadius = 20;
    self.title.layer.masksToBounds = YES;
}

- (void)setTextModel:(YHTextCellModel *)textModel {
    
    _textModel = textModel;
    self.textName.text = textModel.name;
    self.textTime.text = textModel.passtime;
    self.textLb.text = textModel.text;
    [self.title sd_setImageWithURL:[NSURL URLWithString:textModel.head] forState:UIControlStateNormal];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *strID = @"TextViewCell";
    TextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TextViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

@end
