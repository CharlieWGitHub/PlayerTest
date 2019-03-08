//
//  FileManager.m
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/7.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager
static id fileManager;
+ (instancetype)shareInstence
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      fileManager = [[super alloc] init];
    });
    return fileManager;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      fileManager = [super allocWithZone:zone];
    });
    return fileManager;
}
- (id)copyWithZone:(NSZone *)zone
{
    return fileManager;
}

- (void)addRecordsWithFileName:(NSString *)fileName
{
}

- (void)deleteRecordWithFileName:(NSString *)fileName
{
}

- (void)searchRecordWithFileName:(NSString *)fileName
{
}

@end
