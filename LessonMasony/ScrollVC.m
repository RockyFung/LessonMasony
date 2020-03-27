//
//  ScrollVC.m
//  LessonMasony
//
//  Created by rocky on 2020/3/26.
//  Copyright © 2020 rocky. All rights reserved.
//

#import "ScrollVC.h"
#import "Masonry.h"

@interface ScrollVC ()
@end

@implementation ScrollVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建scrollview
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.alwaysBounceVertical = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // 2.创建containView
    UIView *containView = [UIView new];
    [scrollView addSubview:containView];
    [containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        // 宽度也要撑开
        make.width.equalTo(scrollView);
    }];
    
    // 3. 添加3个控件
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor cyanColor];
    [containView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        // 顶部要约束到containView的顶部
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(containView.mas_safeAreaLayoutGuideTop).offset(20);
        } else {
            make.top.equalTo(containView);
        }
        make.size.mas_equalTo(CGSizeMake(200, 500));
        make.centerX.equalTo(containView);
    }];
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor blueColor];
    [containView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(200, 500));
        make.centerX.equalTo(containView);
    }];
    
    UIView *view3 = [UIView new];
    view3.backgroundColor = [UIColor yellowColor];
    [containView addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view2.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(200, 300));
        make.centerX.equalTo(containView);
        // 底部需要约束到containView的底部
        make.bottom.equalTo(containView).offset(-20);
    }];
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
