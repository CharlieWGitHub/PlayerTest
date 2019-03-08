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
@property (nonatomic, strong) UILabel *recorderLab;
@property (nonatomic, strong) UIImageView *voiceImg;
@property (nonatomic, strong) UIView *alertView;
@end

@implementation AVRecorderView

- (instancetype)initAVRecorderView
{
    if (self == [super init]) {
        self.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.1];
        self.frame =
            //        CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
            [UIScreen mainScreen].bounds;
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

    self.voiceImg = [[UIImageView alloc] initWithFrame:CGRectMake(AlertW / 2 - 40, AlertW / 2 - 50, 40, 65)];
    self.voiceImg.image = [UIImage imageNamed:@"ic_record"];
    [self.alertView addSubview:self.voiceImg];
    [self addSubview:self.alertView];

    self.recorderLab = [[UILabel alloc] initWithFrame:CGRectMake(10, AlertW / 2 - 50 + 65 + 20, AlertW - 20, 20)];
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
        }
        completion:^(BOOL finished){
        }];
}

- (void)hideAVRecorderView
{
    [self removeFromSuperview];
}
@end
