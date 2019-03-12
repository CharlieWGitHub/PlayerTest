//
//  AVRecorderView.h
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/8.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^AVRecorderBlock)(NSInteger index);

@interface AVRecorderView : UIView

- (instancetype)initAVRecorderView;

@property (nonatomic, copy) AVRecorderBlock avRecorderBlock;

- (void)showAVRecorderView;
- (void)hideAVRecorderView;

@property (nonatomic, strong) UIView *alertView;
//文字
@property (nonatomic, strong) UILabel *recorderLab;
//录音的图标
@property (nonatomic, strong) UIImageView *voiceImg;
//取消图标
@property (nonatomic, strong) UIImageView *cancelImg;
//音量图
@property (nonatomic, strong) UIImageView *volumeImg;


@end

NS_ASSUME_NONNULL_END
