//
//  ViewController.m
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/6.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

#import "AVPlayerViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "AVImagePicker.h"
#import "AVRecorder.h"
#import "AVRecorderView.h"

@interface ViewController () <UIImagePickerControllerDelegate, AVRecorderDelegate, UINavigationControllerDelegate>
@property (nonatomic, copy) NSString *strPath;
@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic, strong) AVRecorder *recorder;
@property (nonatomic, strong) AVRecorderView *recorderView;
@property (weak, nonatomic) IBOutlet UIButton *recorderButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"留言板";
    [self makeAnimation];

    [self.recorderButton addTarget:self action:@selector(buttonAction:forEvent:) forControlEvents:UIControlEventAllTouchEvents];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)buttonAction:(id)sender forEvent:(UIEvent *)event
{
    UITouchPhase phase = event.allTouches.anyObject.phase;
    if (phase == UITouchPhaseBegan) {
        [self.recorderView showAVRecorderView];
    }
    else if (phase == UITouchPhaseEnded) {
        [self performSelector:@selector(cancelsTouchesself) withObject:self afterDelay:0.5];
    }
}
- (void)cancelsTouchesself
{
    self.recorderView.cancelImg.hidden = YES;
    self.recorderView.voiceImg.hidden = NO;
    self.recorderView.volumeImg.hidden = NO;
    self.recorderView.recorderLab.backgroundColor = [UIColor clearColor];
    [self.recorderView hideAVRecorderView];
}
- (AVRecorder *)recorder
{
    if (!_recorder) {
        _recorder = [[AVRecorder alloc] initWithDelegate:self];
    }
    return _recorder;
}
- (AVAudioPlayer *)player
{
    if (!_player) {
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:self.strPath] error:nil];
    }
    return _player;
}
- (AVRecorderView *)recorderView
{
    if (!_recorderView) {
        _recorderView = [[AVRecorderView alloc] initAVRecorderView];
    }
    return _recorderView;
}
#pragma mark 录音
- (IBAction)Recornd:(id)sender
{
    //    [self.recorder start];
    //    [SVProgressHUD showSuccessWithStatus:@"开始录音"];
    //
    //    if (_player) {
    //        if (_player.isPlaying) {
    //            [_player stop];
    //        }
    //        _player = nil;
    //    }
}
//从录音拖到外部的时候，要变化状态 ；暂停录音；UI变化 文字背景颜色，图片变成弯的
- (IBAction)dragOutside:(id)sender
{
    self.recorderView.recorderLab.backgroundColor = [UIColor colorWithRed:160 / 255.0f green:82 / 255.0f blue:45 / 255.0f alpha:1];
    self.recorderView.cancelImg.hidden = NO;
    self.recorderView.voiceImg.hidden = YES;
    self.recorderView.volumeImg.hidden = YES;
}

//进入内部范围
- (IBAction)dragInside:(id)sender
{
    self.recorderView.cancelImg.hidden = YES;
    self.recorderView.voiceImg.hidden = NO;
    self.recorderView.volumeImg.hidden = NO;
    self.recorderView.recorderLab.backgroundColor = [UIColor clearColor];
}


#pragma mark 视频
- (IBAction)Video:(id)sender
{
    AVImagePicker *ipc = [[AVImagePicker alloc] init];
    [ipc cSetSourceType];
    [self presentViewController:ipc animated:YES completion:nil];
}
#pragma mark 图片
- (IBAction)Picture:(id)sender
{
}
#pragma mark 留言
- (IBAction)Word:(id)sender
{
}
#pragma mark 左边按钮
- (IBAction)leftItemClicked:(id)sender
{
    NSLog(@"左边");
    //    [self.recorder stop];
}
#pragma mark 右边按钮
- (IBAction)rightItemClicked:(id)sender
{
    NSLog(@"右边");

    //    if (self.player) {
    //        [self.player play];
    //    }
}


- (void)endConvertWithMP3FileName:(NSString *)filePath
{
    self.strPath = filePath;
    [SVProgressHUD showSuccessWithStatus:@"录音成功"];
}

- (void)failRecord
{
    [SVProgressHUD showSuccessWithStatus:@"录音失败"];
}

//更新扬声器
- (void)peakPowerForChannel:(double)peakPowerForChannel
{
    NSLog(@"peakPowerForChannel=%f", peakPowerForChannel);
}
//超过最大录音时间，停止录音
- (void)maxTimeStopRecord
{
}

- (void)recordTime:(double)time
{
    NSLog(@"录制时间%f", time);
}


#pragma mark 动画
- (void)makeAnimation
{
}

@end
