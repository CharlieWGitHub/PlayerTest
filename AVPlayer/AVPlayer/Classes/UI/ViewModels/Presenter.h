//
//  Presenter.h
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/13.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RecorderModel.h"
#import <YYKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol PresentDelegate <NSObject>

// 需求 : 逻辑 (面向协议编程)
// 协议驱动代码 : 接口  需求驱动
@optional // 可选实现的方法
// cell : num  ---> model (self.dataArray[indexPath.row])
- (void)didClickBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath;
- (void)reloadData;
- (void)startAnimating;

// presnet : BasePresent
@end

@interface Presenter : NSObject

@property (nonatomic, weak) id<PresentDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

NS_ASSUME_NONNULL_END
