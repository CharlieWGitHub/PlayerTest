//
//  AVRecorderView.m
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/8.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import "AVRecorderView.h"
#define AlertW 150

@interface AVRecorderView ()
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation AVRecorderView
- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(audioVolumeChange) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}
- (void)dealloc
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}
- (instancetype)initAVRecorderView
{
    if (self == [super init]) {
        self.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.1];
        self.frame = [UIScreen mainScreen].bounds;
        [self creatUI];
    }
    return self;
}
- (void)creatUI
{
    self.alertView = [[UIView alloc] init];
    self.alertView.backgroundColor = [UIColor colorWithRed:0 / 256.0f green:0 / 256.0f blue:0 / 256.0f alpha:0.3];
    self.alertView.layer.cornerRadius = 5.0;
    self.alertView.frame = CGRectMake(0, 0, AlertW, AlertW);
    self.alertView.layer.position = self.center;
    //  录音图标
    self.voiceImg = [[UIImageView alloc] initWithFrame:CGRectMake(AlertW / 2 - 40, AlertW / 2 - 50, 40, 65)];
    self.voiceImg.image = [UIImage imageNamed:@"ic_record"];
    self.voiceImg.hidden = NO;
    [self.alertView addSubview:self.voiceImg];
    //  音量图
    self.volumeImg = [[UIImageView alloc] initWithFrame:CGRectMake(AlertW / 2 + 10, AlertW / 2 - 50, 30, 65)];
    self.volumeImg.image = [UIImage imageNamed:@"ic_record_ripple_0"];
    self.volumeImg.hidden = NO;
    [self.alertView addSubview:self.volumeImg];


    //  取消图标
    self.cancelImg = [[UIImageView alloc] initWithFrame:CGRectMake(AlertW / 2 - 20, AlertW / 2 - 50, 42, 65)];
    self.cancelImg.image = [UIImage imageNamed:@"ic_release_to_cancel"];
    self.cancelImg.hidden = YES;
    [self.alertView addSubview:self.cancelImg];


    self.recorderLab = [[UILabel alloc] initWithFrame:CGRectMake(10, AlertW / 2 - 50 + 65 + 33, AlertW - 20, 20)];
    self.recorderLab.text = @"手指上滑，取消发送";
    self.recorderLab.font = [UIFont systemFontOfSize:14];
    self.recorderLab.textColor = [UIColor whiteColor];
    [self.alertView addSubview:self.recorderLab];
    [self addSubview:self.alertView];
}

- (void)showAVRecorderView
{
    UIWindow *rootWindow = [UIApplication sharedApplication].keyWindow;
    [rootWindow addSubview:self];
    [self creatShowAnimation];
}
- (void)creatShowAnimation
{
    self.alertView.layer.position = self.center;
    self.alertView.transform = CGAffineTransformMakeScale(0.90, 0.90);
    [UIView animateWithDuration:0.25
        delay:0
        usingSpringWithDamping:0.8
        initialSpringVelocity:1
        options:UIViewAnimationOptionCurveLinear
        animations:^{
          self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
          [self.timer setFireDate:[NSDate distantPast]];
        }
        completion:^(BOOL finished){
        }];
}

- (void)hideAVRecorderView
{
    [self.timer setFireDate:[NSDate distantFuture]];
    [self removeFromSuperview];
}

- (void)audioVolumeChange
{
    int x = arc4random() % 81;
    [self showVolumeImgWithVolumeNumber:x];
}
- (void)showVolumeImgWithVolumeNumber:(NSInteger)volumeNum
{
    if (volumeNum > 0 && volumeNum <= 10) {
        self.volumeImg.image = [UIImage imageNamed:@"ic_record_ripple_0"];
    }
    else if (volumeNum > 10 && volumeNum <= 20) {
        self.volumeImg.image = [UIImage imageNamed:@"ic_record_ripple_1"];
    }
    else if (volumeNum > 20 && volumeNum <= 30) {
        self.volumeImg.image = [UIImage imageNamed:@"ic_record_ripple_2"];
    }
    else if (volumeNum > 30 && volumeNum <= 40) {
        self.volumeImg.image = [UIImage imageNamed:@"ic_record_ripple_3"];
    }
    else if (volumeNum > 40 && volumeNum <= 50) {
        self.volumeImg.image = [UIImage imageNamed:@"ic_record_ripple_4"];
    }
    else if (volumeNum > 50 && volumeNum <= 60) {
        self.volumeImg.image = [UIImage imageNamed:@"ic_record_ripple_5"];
    }
    else if (volumeNum > 60 && volumeNum <= 70) {
        self.volumeImg.image = [UIImage imageNamed:@"ic_record_ripple_6"];
    }
    else if (volumeNum > 70 && volumeNum <= 80) {
        self.volumeImg.image = [UIImage imageNamed:@"ic_record_ripple_7"];
    }
    else {
        self.volumeImg.image = [UIImage imageNamed:@"ic_record_ripple_8"];
    }
}


@end
