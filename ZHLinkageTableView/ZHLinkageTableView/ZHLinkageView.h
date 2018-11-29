//
//  ZHLinkageView.h
//  ZHLinkageTableView
//
//  Created by 左梓豪 on 2018/11/29.
//  Copyright © 2018 左梓豪. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHLinkageView : UIView

@property(nonatomic, assign) NSInteger widthRate;//左边宽度比例
@property(nonatomic, strong) NSMutableArray<NSArray *> *dataSourceArr;//传入数据
@property(nonatomic, strong) NSMutableArray *groupTitles;//组名

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
