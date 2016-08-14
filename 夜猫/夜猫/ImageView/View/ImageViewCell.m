//
//  ImageViewCell.m
//  夜猫
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ImageViewCell.h"
#import "YHImageCellModel.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import <UIImage+GIF.h>
#import "Masonry.h"
@interface ImageViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *header;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ImageViewCell

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
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.header.layer.cornerRadius = 20;
    self.header.layer.masksToBounds = YES;
    
}

- (void)setImageModel:(YHImageCellModel *)imageModel {

    _imageModel = imageModel;
    [self.header sd_setImageWithURL:[NSURL URLWithString:imageModel.header] forState:UIControlStateNormal];
    self.name.text = imageModel.name;
    self.time.text = imageModel.time;
    self.text.text = imageModel.text;

    [self.image sd_setImageWithURL:[NSURL URLWithString:imageModel.images] placeholderImage:[UIImage sd_animatedGIFNamed:@"ima"] options:kNilOptions progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        NSLog(@"当前进度:%f", (float)receivedSize/(float)expectedSize);
        imageModel.progress = (float)receivedSize/(float)expectedSize;
//        NSLog(@"%@",NSStringFromCGRect(self.frame));
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        NSLog(@"加载完成");
//        NSLog(@"%@",imageURL);
    }];
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *strID = @"ImageViewCell";
    ImageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ImageViewCell" owner:nil options:nil] firstObject];
    }
    
    return cell;
}

@end
