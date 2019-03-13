//
//  RecorderDateDource.h
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/13.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeaveMessageTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^CellConfigureBefore)(id cell, id model, NSIndexPath *indexPath);


@interface RecorderDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
;

//自定义
- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before;

@property (nonatomic, strong) IBInspectable NSString *cellIdentifier;
@property (nonatomic, copy) CellConfigureBefore cellConfigureBefore;


- (void)addDataArray:(NSArray *)datas;

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
