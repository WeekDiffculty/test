//
//  YHTextCellModel.h
//  梗次元
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHTextCellModel : NSObject

@property (nonatomic, strong) NSString *head;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *passtime;
@property (nonatomic, strong) NSString *text;

- (instancetype)initWithDictionary:(NSDictionary *)dicData;
+ (instancetype)modelWithDictionary:(NSDictionary *)dicData;

@end
