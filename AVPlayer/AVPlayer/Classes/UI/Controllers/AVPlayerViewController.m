//
//  AVPlayerViewController.m
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/6.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import "AVPlayerViewController.h"
#import "CLPlayerView.h"
#import "UIView+CLSetRect.h"

@interface AVPlayerViewController ()
@property (nonatomic, weak) CLPlayerView *playerView;

@end

@implementation AVPlayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"AVPlayer";
    [self creatAVPlayer];

    // Do any additional setup after loading the view.
}
- (void)creatAVPlayer
{

    CLPlayerView *playerView = [[CLPlayerView alloc] initWithFrame:CGRectMake(0, 64, self.view.CLwidth, 300)];
    //    CLPlayerView *playerView = [[CLPlayerView alloc]initWithFrame:self.view.bounds];
    _playerView = playerView;
    [self.view addSubview:_playerView];
    [_playerView updateWithConfig:^(CLPlayerViewConfig *config) {
      //重复播放，默认不播放
      config.repeatPlay = NO;
      //当前控制器是否支持旋转，当前页面支持旋转的时候需要设置，告知播放器
      config.isLandscape = YES;
      //全屏是否隐藏状态栏，默认一直不隐藏
      config.fullStatusBarHiddenType = FullStatusBarHiddenFollowToolBar;
      //顶部工具条隐藏样式，默认不隐藏
      config.topToolBarHiddenType = TopToolBarHiddenSmall;
    }];
    //视频地址-本地
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"video" ofType:@"mp4"];

    _playerView.url = [NSURL fileURLWithPath:urlStr];
    //播放
    [_playerView playVideo];
    //返回按钮点击事件回调,小屏状态才会调用，全屏默认变为小屏
    [_playerView backButton:^(UIButton *button) {
      NSLog(@"返回按钮被点击");
    }];
    //播放完成回调
    [_playerView endPlay:^{
      NSLog(@"播放完成");
    }];
}
- (void)viewDidDisappear:(BOOL)animated
{
    [_playerView destroyPlayer];
}
#pragma mark-- 需要设置全局支持旋转方向，然后重写下面三个方法可以让当前页面支持多个方向
// 是否支持自动转屏
- (BOOL)shouldAutorotate
{
    return YES;
}
// 支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}
// 默认的屏幕方向（当前ViewController必须是通过模态出来的UIViewController（模态带导航的无效）方式展现出来的，才会调用这个方法）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
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
