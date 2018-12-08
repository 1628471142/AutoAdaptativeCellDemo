//
//  MultipleSubviewsTableViewCell.h
//  AutoAdaptativeCellDemo
//
//  Created by 1 on 2018/12/8.
//  Copyright © 2018 weiyian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MultipleSubviewsTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel * contentLab;//内容
@property (nonatomic, strong) UILabel * nickLab;//昵称或标题
@property (nonatomic, strong) UIImageView *headImageView;//头像

@property (nonatomic, strong) UIImageView * bubbleImageView;//气泡背景

@end

NS_ASSUME_NONNULL_END
