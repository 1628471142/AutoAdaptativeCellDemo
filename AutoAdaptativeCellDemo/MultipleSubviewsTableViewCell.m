//
//  MultipleSubviewsTableViewCell.m
//  AutoAdaptativeCellDemo
//
//  Created by 1 on 2018/12/8.
//  Copyright © 2018 weiyian. All rights reserved.
//

#import "MultipleSubviewsTableViewCell.h"

@implementation MultipleSubviewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setBackgroundColor:XFBackgroundColor];
        [self addOwnViews];
    }
    return self;
    
}

- (void)addOwnViews{
    
    _headImageView = [[UIImageView alloc] init];
    _nickLab = [[UILabel alloc] init];
    _nickLab.font = [UIFont systemFontOfSize:12];
    _nickLab.textColor = [UIColor colorWithWhite:0.7 alpha:1];

    _bubbleImageView = [[UIImageView alloc] init];
    [self setBubbleShowStyle];
    
    _contentLab = [[UILabel alloc] init];
    _contentLab.font = [UIFont systemFontOfSize:15];
    _contentLab.numberOfLines = 0;
    _contentLab.lineBreakMode = UILineBreakModeCharacterWrap;

    [self.contentView addSubview:_headImageView];
    [self.contentView addSubview:_nickLab];
    [self.contentView addSubview:_bubbleImageView];
    [self.contentView addSubview:_contentLab];
    
    [self layoutIfNeeded];// 布局
    
}



//cell高度自适应
- (void)layoutSubviews{
    
    [_headImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.contentView).offset(12);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    [_nickLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headImageView);
        make.left.equalTo(_headImageView.mas_right).offset(8);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(15);
    }];
    
    [_bubbleImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nickLab.mas_bottom);
        make.bottom.equalTo(self.contentView).offset(-15);
        make.left.equalTo(_headImageView.mas_right);
        make.width.mas_equalTo(ScreenWidth*2/3);
        make.height.equalTo(_contentLab).offset(26);
    }];
    
    
    [_contentLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bubbleImageView).offset(13);
        make.left.equalTo(_bubbleImageView).offset(20);
        make.right.equalTo(_bubbleImageView).offset(-13);
    }];
    
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

//设置气泡拉伸方式
- (void)setBubbleShowStyle{
    
    CGFloat top = 32;       // 顶端盖高度
    CGFloat bottom = 8;    // 底端盖高度
    CGFloat left = 15;     // 左端盖宽度
    CGFloat right = 15;    // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    /*
     * Stretch  拉伸
     * Tile     平铺
     */
    UIImage *image = [[UIImage imageNamed:@"bubble_icon"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    [_bubbleImageView setImage:image];
    
}

@end
