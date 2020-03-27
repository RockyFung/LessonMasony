//
//  ArrayVC.m
//  LessonMasony
//
//  Created by rocky on 2020/3/26.
//  Copyright © 2020 rocky. All rights reserved.
//

#import "ArrayVC.h"
#import "Masonry.h"
@interface ArrayVC ()

@end

@implementation ArrayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置间隔宽度，item宽度自适应
    UIView *bg = [UIView new];
    [self.view addSubview:bg];
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.equalTo(self.view.mas_topMargin);
        }
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    
    NSArray *titleAry = @[@"间",@"隔",@"固",@"定"];
    NSMutableArray *btns = [NSMutableArray new];
    [titleAry enumerateObjectsUsingBlock:^(NSString   * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton new];
        [btn setTitle:obj forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        btn.backgroundColor = [UIColor cyanColor];
        [bg addSubview:btn];
        [btns addObject:btn];
        
    }];
    [btns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:0 tailSpacing:0];
    [btns mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.equalTo(bg);
    }];
    
   // 设置item宽度，间隙宽度自适应
    UIView *bg2 = [UIView new];
    [self.view addSubview:bg2];
    [bg2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg.mas_bottom).offset(20);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    NSArray *titleAry2 = @[@"宽",@"度",@"固",@"定"];
    NSMutableArray *btns2 = [NSMutableArray new];
    [titleAry2 enumerateObjectsUsingBlock:^(NSString   * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton new];
        [btn setTitle:obj forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        btn.backgroundColor = [UIColor blueColor];
        [bg2 addSubview:btn];
        [btns2 addObject:btn];
        
    }];
    
    [btns2 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:80 leadSpacing:20 tailSpacing:50];
    [btns2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(bg2);
    }];
    
    // 设置间隔宽度，item高度自适应
    UIView *bg3 = [UIView new];
    [self.view addSubview:bg3];
    [bg3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg2.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100 * 4);
    }];
    NSArray *titleAry3 = @[@"间",@"隔",@"固",@"定"];
    NSMutableArray *btns3 = [NSMutableArray new];
    [titleAry3 enumerateObjectsUsingBlock:^(NSString   * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton new];
        [btn setTitle:obj forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        btn.backgroundColor = [UIColor brownColor];
        [bg3 addSubview:btn];
        [btns3 addObject:btn];
        
    }];
    
    [btns3 mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:10 leadSpacing:30 tailSpacing:0];
    [btns3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.equalTo(bg3);
    }];
    
    

}


@end
