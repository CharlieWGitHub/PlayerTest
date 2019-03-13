//
//  RecorderModel.h
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/13.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecorderModel : NSObject
@property (nonatomic, strong) NSString *recorderDate; //年月日
@property (nonatomic, strong) NSString *recorderHour; //小时分钟
@property (nonatomic, strong) NSString *recorderLength; //时长
@property (nonatomic, strong) NSString *recorderPath; //本地保存地址
@property (nonatomic, strong) NSString *recorderId; //录音id


@end

NS_ASSUME_NONNULL_END
