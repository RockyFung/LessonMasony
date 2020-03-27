//
//  MoreItemsVC.m
//  LessonMasony
//
//  Created by rocky on 2020/3/26.
//  Copyright © 2020 rocky. All rights reserved.
//

#import "MoreItemsVC.h"
#import "Masonry.h"

@interface MoreItemsVC ()

@end

@implementation MoreItemsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
     [label setContentCompressionResistancePriority:UILayoutPriorityFittingSizeLevel forAxis:UILayoutConstraintAxisHorizontal]; // 抗压缩能力  :抗压等级
     [label setContentHuggingPriority:UILayoutPriorityRequired
            forAxis:UILayoutConstraintAxisHorizontal]; // 抗拉伸能力  :抗拉等级
     */
    
    
    UIView *cell1 = [self getCellWithString:@"短文本"];
    [self.view addSubview:cell1];
    [cell1 mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(20);
        } else {
            make.top.equalTo(self.view);
        }
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    
    UIView *cell2 = [self getCellWithString:@"长文本长文本长文本长文本长文本长文本长文本长文本长文本长文本"];
    [self.view addSubview:cell2];
    [cell2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell1.mas_bottom).offset(1);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
}

- (UIView *)getCellWithString:(NSString *)str{
    UIView *bg = [UIView new];
    bg.backgroundColor = [UIColor lightGrayColor];
    
    // 固定宽度
    UILabel *label1 = [UILabel new];
    label1.text = @"固定宽度";
    [bg addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bg);
        make.left.equalTo(bg).offset(10);
        
    }];
//    [label1 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];//不可以被压缩，尽量显示完整
    
    // 可压缩不定长度文本
    UILabel *label2 = [UILabel new];
    label2.text = str;
    label2.textColor = [UIColor blueColor];
    [bg addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_right).offset(10);
        make.centerY.equalTo(bg);
    }];
    [label2 setContentCompressionResistancePriority:UILayoutPriorityFittingSizeLevel forAxis:UILayoutConstraintAxisHorizontal];//宽度不够时，可以被压缩
//    [label2 setContentHuggingPriority:UILayoutPriorityRequired
//    forAxis:UILayoutConstraintAxisHorizontal];/*抱紧*/
    
    // 靠左固定
    UILabel *label3 = [UILabel new];
    label3.text = @"置顶";
    label3.textColor = [UIColor redColor];
    label3.layer.borderColor = [UIColor redColor].CGColor;
    label3.layer.borderWidth = 1;
    label3.layer.cornerRadius = 5;
    [bg addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        // 在设置left和right的时候，需要对left使用高优先级，需要对right使用低优先级。
        make.left.equalTo(label2.mas_right).offset(10).priorityHigh();
        make.right.equalTo(bg).offset(-10).priorityLow();
        make.centerY.equalTo(bg);
        make.height.mas_equalTo(30);
    }];
    return  bg;
}



@end
