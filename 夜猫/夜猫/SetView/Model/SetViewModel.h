//
//  SetViewModel.h
//  夜猫
//
//  Created by qingyun on 16/8/10.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SetViewModel : NSObject

@property (nonatomic, copy) NSString *strImage;
@property (nonatomic, copy) NSString *strText;

+ (instancetype)modelWithDictionary:(NSDictionary *)dicData;

@end
