//
//  LeaveMessageTableViewCell.m
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/13.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import "LeaveMessageTableViewCell.h"

@implementation LeaveMessageTableViewCell

+ (instancetype)shareLeaveMessage
{
    return [[[NSBundle mainBundle] loadNibNamed:@"LeaveMessageTableViewCell" owner:nil options:nil] lastObject];
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)play:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickBtnWithNum:indexPath:)]) {
        [self.delegate didClickBtnWithNum:@"" indexPath:self.indexPath];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
