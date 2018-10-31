//
//  ChangeHeightItem.m
//  ScrollLayoutDemo
//
//  Created by lixiong on 2018/10/25.
//  Copyright © 2018年 xiongli. All rights reserved.
//

#import "ChangeHeightItem.h"
#import <Masonry.h>

@interface ChangeHeightItem()

@property(nonatomic,strong)UIView * contentView;
@property(nonatomic,strong)UIButton * mButton;


@end


static MASConstraint * heightConstraint = nil;

@implementation ChangeHeightItem


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void) setupUI {
    
    self.backgroundColor = UIColor.greenColor;
    _contentView = [[UIView alloc]init];
    _contentView.backgroundColor = [UIColor redColor];
    [self addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@30);
        make.left.equalTo(@25);
        make.right.equalTo(@(-25));
        heightConstraint =  make.height.equalTo(@80);
    }];
    
    
    _mButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [_mButton setTitle:@"改变高度" forState:UIControlStateNormal];
    [_mButton addTarget:self action:@selector(changeHeightAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_mButton];
    [_mButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.centerX.equalTo(self);
    }];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mButton).offset(20);
    }];
}

- (void)changeHeightAction:(id)sender {
    
    if (heightConstraint != nil) {
        [heightConstraint deactivate];
    }
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@160);
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
