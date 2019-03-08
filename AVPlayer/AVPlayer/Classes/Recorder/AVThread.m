//
//  AVThread.m
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/8.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import "AVThread.h"

@interface AVThread ()
@property (nonatomic, assign) BOOL waitSignal;
@property (nonatomic, strong) NSCondition *condition;
@end
@implementation AVThread

+ (AVThread *)currentThread
{
    return [[AVThread alloc] init];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.waitSignal = NO;
        self.condition = [[NSCondition alloc] init];
    }
    return self;
}

- (BOOL)sendWaitSignal
{
    [self.condition lock];
    self.waitSignal = YES;
    [self.condition unlock];
    return self.waitSignal;
}

- (BOOL)waitSignal
{
    return _waitSignal;
}

- (void)sleep:(NSInteger)seconds
{
    if (seconds == 0) {
        [self wait];
    }
    else {
        [self.condition lock];
        [self.condition waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:seconds]];
        [self.condition unlock];
    }
}

- (void)wait
{
    [self.condition lock];
    [self.condition wait];
    [self.condition unlock];
}

- (void)signal
{
    [self.condition lock];
    self.waitSignal = NO;
    [self.condition signal];
    [self.condition unlock];
}

- (void)broadcast
{
    [self.condition lock];
    self.waitSignal = NO;
    [self.condition broadcast];
    [self.condition unlock];
}


@end
