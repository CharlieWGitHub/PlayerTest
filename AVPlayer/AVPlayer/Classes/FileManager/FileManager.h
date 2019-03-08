//
//  FileManager.h
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/7.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileManager : NSObject

+ (instancetype)shareInstence;

//增加数据
- (void)addRecordsWithFileName:(NSString *)fileName;
//删除
- (void)deleteRecordWithFileName:(NSString *)fileName;
//查找
- (void)searchRecordWithFileName:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
