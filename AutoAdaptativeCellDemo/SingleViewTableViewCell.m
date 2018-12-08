//
//  SingleViewTableViewCell.m
//  AutoAdaptativeCellDemo
//
//  Created by 1 on 2018/12/8.
//  Copyright © 2018 weiyian. All rights reserved.
//

#import "SingleViewTableViewCell.h"

@implementation SingleViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self addOwnViews];
    }
    return self;
    
}

- (void)addOwnViews{
    
    _contentLab = [[UILabel alloc] init];
    _contentLab.numberOfLines = 0;
    
    [self.contentView addSubview:_contentLab];
    
    [self layoutIfNeeded];// 布局
    
}



//cell高度自适应
- (void)layoutSubviews{
    
    [_contentLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(12);
        make.bottom.equalTo(self.contentView).offset(-12);
        make.left.equalTo(self.contentView).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
    }];
    
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

@end
