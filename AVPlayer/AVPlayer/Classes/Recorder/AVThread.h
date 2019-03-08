//
//  AVThread.h
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/8.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AVThread : NSObject

+ (AVThread *)currentThread;


/**
 发送等待信号
 
 @return 是否等待
 */
- (BOOL)sendWaitSignal;

/**
 等待信号
 
 @return 是否去等待
 */
- (BOOL)waitSignal;

/**
 休眠（seconds == 0 即 wait函数）
 
 @param seconds 秒
 */
- (void)sleep:(NSInteger)seconds;
/**
 线程等待
 */
- (void)wait;

/**
 线程继续
 */
- (void)signal;

/**
 控制的全部线程继续
 */
- (void)broadcast;
@end

NS_ASSUME_NONNULL_END
