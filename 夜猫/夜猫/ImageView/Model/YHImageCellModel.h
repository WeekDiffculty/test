//
//  YHImageCellModel.h
//  夜猫
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHImageCellModel : UITableViewCell

@property (nonatomic, strong) NSString *header;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *images;
@property (nonatomic, strong) NSString *imagesGif;
@property (nonatomic, assign) CGFloat rowH ,progress;
- (instancetype)initWithDictionary:(NSDictionary *)dicData;
+ (instancetype)modelWithDictionary:(NSDictionary *)dicData;

@end
