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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"留言板";
    [self makeAnimation];

    // Do any additional setup after loading the view, typically from a nib.
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
#pragma mark 录音
- (IBAction)Recornd:(id)sender
{


    AVRecorderView *av = [[AVRecorderView alloc] initAVRecorderView];

    [av showAVRecorderView];


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


- (void)peakPowerForChannel:(double)peakPowerForChannel
{
}

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
