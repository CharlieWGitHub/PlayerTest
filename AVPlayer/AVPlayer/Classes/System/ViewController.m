//
//  ViewController.m
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/6.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import "ViewController.h"
#import "AVPlayerViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"HELLO K";


    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)gotoAVPlayerVC:(id)sender
{

    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera; //sourcetype有三种分别是camera，photoLibrary和photoAlbum
    ipc.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    NSArray *availableMedia = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera]; //Camera所支持的Media格式都有哪些,共有两个分别是@"public.image",@"public.movie"
    ipc.mediaTypes = [NSArray arrayWithObject:availableMedia[1]]; //设置媒体类型为public.movie
    [self presentViewController:ipc animated:YES completion:nil];
    ipc.videoMaximumDuration = 60.0f; //30秒
    ipc.delegate = self; //设置委托
    //在录制视频的界面添加点东西
    UIView *BgView = [[UIView alloc] init];
    BgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);

    UILabel *lab = [[UILabel alloc] init];
    lab.frame = CGRectMake(0, 10, 200, 100);
    lab.text = @"欢迎来到玛法大陆";
    lab.numberOfLines = 0;
    lab.textColor = [UIColor orangeColor];
    [BgView addSubview:lab];

    ipc.cameraOverlayView = BgView;
    //    AVPlayerViewController * av = [[AVPlayerViewController alloc]init];
    //    [self.navigationController pushViewController:av animated:YES];
}
- (CGFloat)getFileSize:(NSString *)path
{
    NSLog(@"%@", path);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    float filesize = -1.0;
    if ([fileManager fileExistsAtPath:path]) {
        NSDictionary *fileDic = [fileManager attributesOfItemAtPath:path error:nil]; //获取文件的属性
        unsigned long long size = [[fileDic objectForKey:NSFileSize] longLongValue];
        filesize = 1.0 * size / 1024;
    }
    else {
        NSLog(@"找不到文件");
    }
    return filesize;
} //此方法可以获取文件的大小，返回的是单位是KB。
//- (CGFloat) getVideoLength:(NSURL *)URL
//{
//    AVURLAsset *avUrl = [AVURLAsset assetWithURL:URL];
//    CMTime time = [avUrl duration];
//    int second = ceil(time.value/time.timescale);
//    return second;
//}//
//完成视频录制，并压缩后显示大小、时长
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSURL *sourceURL = [info objectForKey:UIImagePickerControllerMediaURL];
    //    NSLog(@"%@",[NSString stringWithFormat:@"%f s", [self getVideoLength:sourceURL]]);
    NSLog(@"=======%@", [NSString stringWithFormat:@"%.2f kb", [self getFileSize:[sourceURL path]]]);

    NSURL *newVideoUrl; //一般.mp4
    NSDateFormatter *formater = [[NSDateFormatter alloc] init]; //用时间给文件全名，以免重复，在测试的时候其实可以判断文件是否存在若存在，则删除，重新生成文件即可
    [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    newVideoUrl = [NSURL fileURLWithPath:[NSHomeDirectory() stringByAppendingFormat:@"/Documents/output-%@.mp4", [formater stringFromDate:[NSDate date]]]];
    //这个是保存在app自己的沙盒路径里，后面可以选择是否在上传后删除掉。我建议删除掉，免得占空间。
    NSString *fileName = [NSString stringWithFormat:@"output-%@.mp4", [formater stringFromDate:[NSDate date]]];

    NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];
    NSString *urlStr = [url path];
    if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlStr)) {
        //保存视频到相簿，注意也可以使用ALAssetsLibrary来保存
        UISaveVideoAtPathToSavedPhotosAlbum(urlStr, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    }


    [picker dismissViewControllerAnimated:YES completion:nil];

    //    [self convertVideoQuailtyWithInputURL:sourceURL outputURL:newVideoUrl completeHandler:nil];
}


#pragma mark - 自定义方法
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{

    if (error) {
        NSLog(@"保存视频过程中发生错误，错误信息:%@", error.localizedDescription);
    }
    else {
        NSLog(@"视频保存成功");

        //        _videoUrl = videoPath;
        //        NSURL * url = [NSURL fileURLWithPath:videoPath];

        //  self.dateTimeLab.text = [LYWRegex getCurrentTimes];
        //获取视频第一帧
        // [self.showBtn setBackgroundImage:[LYWRegex thumbnailImageForVideo:url atTime:1] forState:UIControlStateNormal];
    }
}
@end
