//
//  ViewController.m
//  ZHLinkageTableView
//
//  Created by 左梓豪 on 2018/11/29.
//  Copyright © 2018 左梓豪. All rights reserved.
//

#import "ViewController.h"
#import "ZHLinkageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSubViews];
}

- (void)initSubViews {
    ZHLinkageView *linkageView = [[ZHLinkageView alloc] initWithFrame:self.view.frame];
    linkageView.dataSourceArr = @[
                                  @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"],
                                  @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"],
                                  @[@"1",@"2",@"3",@"4",@"5"],
                                  @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"],
                                  @[@"1",@"2",@"3"],
                                  @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"],
                                  @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"],
                                  @[@"1",@"2",@"3",@"4",@"5"],
                                  @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"],
                                  @[@"1",@"2",@"3",@"2",@"5",@"101"]
                                  ].mutableCopy;
    linkageView.groupTitles = @[@"第0组",@"第1组",@"第2组",@"第3组",@"第4组",@"第5组",@"第6组",@"第7组",@"第8组",@"第9组"].mutableCopy;
    [self.view addSubview:linkageView];
}


@end
