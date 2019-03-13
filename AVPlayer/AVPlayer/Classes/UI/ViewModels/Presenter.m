//
//  Presenter.m
//  AVPlayer
//
//  Created by 王成龙 on 2019/3/13.
//  Copyright © 2019 Charlie. All rights reserved.
//

#import "Presenter.h"

@implementation Presenter
- (instancetype)init
{
    if (self = [super init]) {

        [self loadData];
    }
    return self;
}
- (void)loadData
{
    NSArray *temArray =
        @[
           @{ @"recorderDate" : @"14日 2019.3",
              @"recorderHour" : @"10:20 app留言",
              @"recorderLength" : @"9",
              @"recorderPath" : @"",
              @"recorderId" : @"1" },
           @{ @"recorderDate" : @"12日 2019.3",
              @"recorderHour" : @"10:20 APP留言",
              @"recorderLength" : @"9",
              @"recorderPath" : @"",
              @"recorderId" : @"2" },
           @{ @"recorderDate" : @"11日 2019.3",
              @"recorderHour" : @"10:20 APP留言",
              @"recorderLength" : @"9",
              @"recorderPath" : @"",
              @"recorderId" : @"3" },
           @{ @"recorderDate" : @"10日 2019.3",
              @"recorderHour" : @"10:20 APP留言",
              @"recorderLength" : @"59",
              @"recorderPath" : @"",
              @"recorderId" : @"4" },
           @{ @"recorderDate" : @"19日 2019.2",
              @"recorderHour" : @"10:20 APP留言",
              @"recorderLength" : @"49",
              @"recorderPath" : @"",
              @"recorderId" : @"5" }
        ];
    for (int i = 0; i < temArray.count; i++) {
        RecorderModel *m = [RecorderModel modelWithDictionary:temArray[i]];
        [self.dataArray addObject:m];
    }
}

- (void)didClickBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath
{
    RecorderModel *model = self.dataArray[indexPath.row];

    if ([model.recorderId integerValue] > 4) {
        [self.dataArray removeAllObjects];
        NSArray *temArray =
            @[
               @{ @"recorderDate" : @"14日 2019.3",
                  @"recorderHour" : @"10:20 app留言",
                  @"recorderLength" : @"9",
                  @"recorderPath" : @"",
                  @"recorderId" : @"1" },
               @{ @"recorderDate" : @"12日 2019.3",
                  @"recorderHour" : @"10:20 APP留言",
                  @"recorderLength" : @"9",
                  @"recorderPath" : @"",
                  @"recorderId" : @"2" },
               @{ @"recorderDate" : @"11日 2019.3",
                  @"recorderHour" : @"10:20 APP留言",
                  @"recorderLength" : @"9",
                  @"recorderPath" : @"",
                  @"recorderId" : @"3" },
               @{ @"recorderDate" : @"10日 2019.3",
                  @"recorderHour" : @"10:20 APP留言",
                  @"recorderLength" : @"59",
                  @"recorderPath" : @"",
                  @"recorderId" : @"4" },
               @{ @"recorderDate" : @"19日 2019.2",
                  @"recorderHour" : @"10:20 APP留言",
                  @"recorderLength" : @"49",
                  @"recorderPath" : @"",
                  @"recorderId" : @"5" },
               @{ @"recorderDate" : @"14日 2019.3",
                  @"recorderHour" : @"10:20 app留言",
                  @"recorderLength" : @"9",
                  @"recorderPath" : @"",
                  @"recorderId" : @"1" },
               @{ @"recorderDate" : @"14日 2019.3",
                  @"recorderHour" : @"10:20 app留言",
                  @"recorderLength" : @"9",
                  @"recorderPath" : @"",
                  @"recorderId" : @"1" },
               @{ @"recorderDate" : @"14日 2019.3",
                  @"recorderHour" : @"10:20 app留言",
                  @"recorderLength" : @"9",
                  @"recorderPath" : @"",
                  @"recorderId" : @"1" },
               @{ @"recorderDate" : @"14日 2019.3",
                  @"recorderHour" : @"10:20 app留言",
                  @"recorderLength" : @"9",
                  @"recorderPath" : @"",
                  @"recorderId" : @"5" },
            ];
        for (int i = 0; i < temArray.count; i++) {
            RecorderModel *m = [RecorderModel modelWithDictionary:temArray[i]];
            [self.dataArray addObject:m];
        }


        if (self.delegate && [self.delegate respondsToSelector:@selector(reloadData)]) {
            [self.delegate reloadData];
        }
    }
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}

@end
