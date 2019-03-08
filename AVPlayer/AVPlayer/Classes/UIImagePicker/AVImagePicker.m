//
//  AVImagePicker.m
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/7.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import "AVImagePicker.h"

@interface AVImagePicker () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation AVImagePicker

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}
- (void)cSetSourceType
{
    self.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    NSArray *availableMedia = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera]; //Camera所支持的Media格式都有哪些,共有两个分别是@"public.image",@"public.movie"
    self.mediaTypes = [NSArray arrayWithObject:availableMedia[1]]; //设置媒体类型为public.movie
    //   视频质量
    self.videoQuality = UIImagePickerControllerQualityTypeHigh;
    //   闪光灯
    self.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;

    //    [self presentViewController:self animated:YES completion:nil];
    self.videoMaximumDuration = 60.0f;
    self.delegate = self; //设置委托
}


- (CGFloat)getFileSize:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    float filesize = -1.0;
    if ([fileManager fileExistsAtPath:path]) {
        NSDictionary *fileDic = [fileManager attributesOfItemAtPath:path error:nil]; //获取文件的属性
        unsigned long long size = [[fileDic objectForKey:NSFileSize] longLongValue];
        filesize = 1.0 * size / 1000;
    }
    else {
        NSLog(@"找不到文件");
    }
    return filesize;
}

//完成视频录制，并压缩后显示大小、时长
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSURL *sourceURL = [info objectForKey:UIImagePickerControllerMediaURL];
    //NSLog(@"%@",[NSString stringWithFormat:@"%f s", [self getVideoLength:sourceURL]]);
    NSLog(@"=======%@", [NSString stringWithFormat:@"%.2f kb", [self getFileSize:[sourceURL path]]]);

    NSURL *newVideoUrl; //一般.mp4
    NSDateFormatter *formater = [[NSDateFormatter alloc] init]; //用时间给文件全名，以免重复，在测试的时候其实可以判断文件是否存在若存在，则删除，重新生成文件即可
    [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    newVideoUrl = [NSURL fileURLWithPath:[NSHomeDirectory() stringByAppendingFormat:@"/Documents/output-%@.mp4", [formater stringFromDate:[NSDate date]]]];
    NSLog(@"newVideoUrl=%@", newVideoUrl);
    //这个是保存在app自己的沙盒路径里，后面可以选择是否在上传后删除掉。我建议删除掉，免得占空间。
    NSString *fileName = [NSString stringWithFormat:@"output-%@.mp4", [formater stringFromDate:[NSDate date]]];
    NSLog(@"视频名字=%@", fileName);

    NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];

    NSString *urlStr = [url path];
    if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlStr)) {
        //保存视频到相簿，注意也可以使用ALAssetsLibrary来保存
        UISaveVideoAtPathToSavedPhotosAlbum(urlStr, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 自定义方法
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{

    if (error) {
        NSLog(@"保存视频过程中发生错误，错误信息:%@", error.localizedDescription);
        NSString *errorStr = [NSString stringWithFormat:@"%@", error.localizedDescription];
        [SVProgressHUD showErrorWithStatus:errorStr];
    }
    else {

        [SVProgressHUD showSuccessWithStatus:@"视频保存成功"];

        //        _videoUrl = videoPath;
        //        NSURL * url = [NSURL fileURLWithPath:videoPath];

        //  self.dateTimeLab.text = [LYWRegex getCurrentTimes];
        //获取视频第一帧
        // [self.showBtn setBackgroundImage:[LYWRegex thumbnailImageForVideo:url atTime:1] forState:UIControlStateNormal];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
