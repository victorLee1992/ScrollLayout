//
//  AsynLoadItem.m
//  ScrollLayoutDemo
//
//  Created by lixiong on 2018/10/26.
//  Copyright © 2018年 xiongli. All rights reserved.
//

#import "AsynLoadItem.h"
#import <Masonry.h>

@interface AsynLoadItem()

@property(nonatomic,strong)UILabel * mLabel;

@end

@implementation AsynLoadItem


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = UIColor.orangeColor;
    
    UILabel * label = [[UILabel alloc]init];
    [label setText:@"这是一端异步展示的文本"];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@25);
        make.height.equalTo(@30);
    }];
    
    
    _mLabel = [[UILabel alloc]init];
    _mLabel.numberOfLines = 0;
    [self addSubview:_mLabel];
    _mLabel.text = @"等待3秒...";
    [_mLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(20);
        make.left.equalTo(@25);
        make.right.equalTo(@(-25));
        make.bottom.equalTo(@(-20));
    }];
}

-(void)loadContent:(NSString *)content {
    _mLabel.text = content;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
