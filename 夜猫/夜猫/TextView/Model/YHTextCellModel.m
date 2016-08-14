//
//  YHTextCellModel.m
//  梗次元
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "YHTextCellModel.h"

@implementation YHTextCellModel

- (instancetype)initWithDictionary:(NSDictionary *)dicData {

    if (self = [super init]) {
        _name = dicData[@"u"][@"name"];
        _head = dicData[@"u"][@"header"][1];
        _text = dicData[@"text"];
        _passtime = dicData[@"passtime"];
    }
    return self;
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dicData {
    
    return [[self alloc] initWithDictionary:dicData];
}


@end
