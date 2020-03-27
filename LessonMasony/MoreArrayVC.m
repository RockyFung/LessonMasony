//
//  MoreArrayVC.m
//  LessonMasony
//
//  Created by rocky on 2020/3/26.
//  Copyright © 2020 rocky. All rights reserved.
//

#import "MoreArrayVC.h"
#import "Masonry.h"
#import "NSArray+Sudoku.h"
@interface MoreArrayVC ()

@end

@implementation MoreArrayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
#pragma mark - 固定item宽高
    // 创建容器
    UIView *bg = [UIView new];
    [self.view addSubview:bg];
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.equalTo(self.view);
        }
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(200);
    }];
    
    // 创建items
    NSMutableArray *items = [NSMutableArray array];
    for (int i = 0; i < 9; i++) {
        UIButton *item = [UIButton new];
        item.backgroundColor = [UIColor cyanColor];
        [bg addSubview:item];
        [items addObject:item];
    }
    // 固定item宽高
    [items mas_distributeSudokuViewsWithFixedItemWidth:100 fixedItemHeight:50 warpCount:3 topSpacing:10 bottomSpacing:10 leadSpacing:10 tailSpacing:10];
    
    
#pragma mark - 九宫格布局 固定ItemSize 固定ItemSpacing 可由九宫格的内容控制SuperView的大小
    // 创建容器
    UIView *bg2 = [UIView new];
    [self.view addSubview:bg2];
    [bg2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg.mas_bottom).offset(20);
        make.left.right.equalTo(self.view);
    }];
    
    // 创建items
    NSMutableArray *items2 = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        UIButton *item = [UIButton new];
        item.backgroundColor = [UIColor yellowColor];
        [bg2 addSubview:item];
        [items2 addObject:item];
    }
    // 固定ItemSize 固定ItemSpacing
    [items2 mas_distributeSudokuViewsWithFixedItemWidth:80 fixedItemHeight:100 fixedLineSpacing:20 fixedInteritemSpacing:20 warpCount:3 topSpacing:10 bottomSpacing:10 leadSpacing:10 tailSpacing:10];
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
