//
//  LeaveMessageTableViewCell.h
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/13.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Presenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface LeaveMessageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLab; //日期
@property (weak, nonatomic) IBOutlet UIButton *playButton; //播放按钮
@property (weak, nonatomic) IBOutlet UILabel *recoderTimeLab; //录音时间
@property (weak, nonatomic) IBOutlet UILabel *leaveMessageLab; //留言时间
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, weak) id<PresentDelegate> delegate;

+ (instancetype)shareLeaveMessage;


@end

NS_ASSUME_NONNULL_END
