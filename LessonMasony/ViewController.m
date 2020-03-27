//
//  ViewController.m
//  LessonMasony
//
//  Created by rocky on 2020/3/26.
//  Copyright © 2020 rocky. All rights reserved.
//

#import "ViewController.h"
#import "ArrayVC.h"
#import "MoreItemsVC.h"
#import "ScrollVC.h"
#import "MoreArrayVC.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *items;
@end

@implementation ViewController

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellid"];
        _tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自动布局";
    self.view.backgroundColor = [UIColor whiteColor];
    _items = @[@"数组布局",@"九宫格",@"抗压优先级",@"滚动视图"];
    [self.view addSubview:self.tableView];
    
    
}

#pragma mark - dataDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    cell.textLabel.text = _items[indexPath.row];
    return  cell;
}
#pragma mark - tableviewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            ArrayVC *vc = [[ArrayVC alloc]init];
            vc.title = _items[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 1:
            {
                MoreArrayVC *vc = [[MoreArrayVC alloc]init];
                vc.title = _items[indexPath.row];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
        case 2:
        {
            MoreItemsVC *vc = [[MoreItemsVC alloc]init];
            vc.title = _items[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
            case 3:
        {
            ScrollVC *vc = [[ScrollVC alloc]init];
            vc.title = _items[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

@end
