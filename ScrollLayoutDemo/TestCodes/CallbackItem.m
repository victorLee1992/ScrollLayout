//
//  CallbackItem.m
//  ScrollLayoutDemo
//
//  Created by lixiong on 2018/10/26.
//  Copyright © 2018年 xiongli. All rights reserved.
//

#import "CallbackItem.h"
#import <Masonry.h>


@implementation CallbackItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void) setupUI {
    
    self.backgroundColor = [UIColor purpleColor];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点击回传" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@30);
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.centerX.equalTo(self);
    }];
}


- (void)clickAction:(UIButton *)sender {
    NSLog(@"点击视图事件，可以使用block，回调参数");
    if (self.itemBlock != nil) {
        self.itemBlock(@"click"/* 可以传递id类型，自行定义*/);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
