//
//  YHImageCellModel.m
//  夜猫
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "YHImageCellModel.h"
#import <ImageIO/ImageIO.h>

@implementation YHImageCellModel

- (instancetype)initWithDictionary:(NSDictionary *)dicData {

    if (self = [super init]) {
        _header = dicData[@"u"][@"header"][0];
        _name = dicData[@"u"][@"name"];
        _time = dicData[@"passtime"];
        _text = dicData[@"text"];
        _images = dicData[@"image"][@"big"][1];
        if (_images == nil) {
            _images = dicData[@"gif"][@"images"][1];
        }

        //动态获取cell高度
        _rowH = [self getRowHWithRequest:[NSMutableURLRequest requestWithURL:[NSURL URLWithString:_images]]];
        
    }
    return self;
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dicData {

    return [[self alloc] initWithDictionary:dicData];
}

// 网上找的
-(CGFloat)getRowHWithRequest:(NSMutableURLRequest*)request
{
    
        [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
        NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        if ([data length] <= 0x58) {
            return 300;
        }
        if ([data length] < 210) {// 肯定只有一个DQT字段
            short w1 = 0, w2 = 0;
            [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
            [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
            short h1 = 0, h2 = 0;
            [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
            [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
            short h = (h1 << 8) + h2;
            return h+102;
        } else {
            short word = 0x0;
            [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
            if (word == 0xdb) {
                [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
                if (word == 0xdb) {// 两个DQT字段
                    short w1 = 0, w2 = 0;
                    [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                    [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                    short h1 = 0, h2 = 0;
                    [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                    [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                    short h = (h1 << 8) + h2;
                    return h+102;
                } else {// 一个DQT字段
                    short w1 = 0, w2 = 0;
                    [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                    [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                    short h1 = 0, h2 = 0;
                    [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                    [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                    short h = (h1 << 8) + h2;
                    return h+102;
                }
            } else {
                return 300;
            }
        }
    
}

@end
