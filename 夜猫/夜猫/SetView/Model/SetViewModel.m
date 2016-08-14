//
//  SetViewModel.m
//  夜猫
//
//  Created by qingyun on 16/8/10.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SetViewModel.h"

@implementation SetViewModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dicData {
    
    SetViewModel *model = [SetViewModel new];
    model.strImage = dicData[@"image"];
    model.strText = dicData[@"text"];

    return model;
}

@end
