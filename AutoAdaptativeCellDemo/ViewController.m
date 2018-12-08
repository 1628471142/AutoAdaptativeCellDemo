//
//  ViewController.m
//  AutoAdaptativeCellDemo
//
//  Created by XFLee on 2018/12/8.
//  Copyright © 2018 weiyian. All rights reserved.
//
#define IsSingle 0//是否为单个文本控件

#import "ViewController.h"
#import "SingleViewTableViewCell.h"
#import "MultipleSubviewsTableViewCell.h"
#import "TestModel.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataSources;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
}


#pragma mark ======= Lazy loading
- (NSArray *)dataSources{
    if (_dataSources == nil) {
        _dataSources = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i < 20; i ++) {
            [_dataSources addObject:[TestModel creatTestModel]];
        }
    }
    return _dataSources;
}
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.estimatedRowHeight = 70;//本句为适配ios12之前且ios10之后的系统，个人理解为它是为了告诉系统，我有一个预计的高度，你不要把cell高度定死了。注：数字非0即可，当然最好是贴近预期cell高度
        
    }
    return _tableView;
}

#pragma mark ======= UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //单个控件
    if (IsSingle) {
        SingleViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SingleViewTableViewCell"];
        if (cell == nil) {
            cell = [[SingleViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SingleViewTableViewCell"];
        }
        TestModel * model = _dataSources[indexPath.row];
        cell.contentLab.text = model.content;
        return cell;
    }
    
    //仿聊天简易界面
    MultipleSubviewsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MultipleSubviewsTableViewCell"];
    if (cell == nil) {
        cell = [[MultipleSubviewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MultipleSubviewsTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    TestModel * model = _dataSources[indexPath.row];
    cell.contentLab.text = model.content;
    cell.nickLab.text = model.title;
    [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:model.headImageUrl] placeholderImage:[UIImage imageNamed:@"head.jpg"]];
    
    return cell;
   
}


@end
