//
//  ZHLinkageView.m
//  ZHLinkageTableView
//
//  Created by 左梓豪 on 2018/11/29.
//  Copyright © 2018 左梓豪. All rights reserved.
//

#import "ZHLinkageView.h"

#define DEFAULT_RATE 4

@interface ZHLinkageView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) UITableView *leftTableView;
@property(nonatomic, strong) UITableView *rightTableView;

@end

@implementation ZHLinkageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createTableView];
    }
    return self;
}

- (void)createTableView {
    if (_leftTableView == nil) {
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/DEFAULT_RATE, self.frame.size.height) style:UITableViewStylePlain];
        _leftTableView.dataSource = self;
        _leftTableView.delegate = self;
        [self addSubview:_leftTableView];
    }
    if (_rightTableView == nil) {
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width/DEFAULT_RATE, 0, self.frame.size.width/DEFAULT_RATE * (DEFAULT_RATE-1), self.frame.size.height) style:UITableViewStylePlain];
        _rightTableView.dataSource = self;
        _rightTableView.delegate = self;
        [self addSubview:_rightTableView];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.dataSourceArr != nil) {
        if (tableView == _rightTableView) {
            NSArray *sectionArr = _dataSourceArr[section];
            return sectionArr.count;
        } else {
            return 1;
        }
    } else {
        return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.dataSourceArr != nil) {
        return self.dataSourceArr.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftTableView) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"left_cell"];
        if (_groupTitles != nil) {
            cell.textLabel.text = _groupTitles[indexPath.section];
        }
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"right_cell"];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView == _rightTableView) {
        return 20.0f;
    }
    return 0.1f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (_groupTitles != nil && tableView == _rightTableView) {
        return _groupTitles[section];
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftTableView) {
        NSInteger section = indexPath.section;
        [_rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _leftTableView) return;
    NSIndexPath *topIndexPath = [[self.rightTableView indexPathsForVisibleRows] firstObject];
    NSIndexPath *targetIndexPath = [NSIndexPath indexPathForRow:0 inSection:topIndexPath.section];
    [self.leftTableView selectRowAtIndexPath:targetIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
}

- (void)setDataSourceArr:(NSMutableArray<NSArray *> *)dataSourceArr {
    _dataSourceArr = dataSourceArr;
    [self reloadData];
}

- (void)setGroupTitles:(NSMutableArray *)groupTitles {
    _groupTitles = groupTitles;
    [self reloadData];
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
}

- (void)reloadData {
    [self.leftTableView reloadData];
    [self.rightTableView reloadData];
}

@end
