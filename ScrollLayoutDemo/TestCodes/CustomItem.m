//
//  CustomItem.m
//  ScrollLayoutDemo
//
//  Created by lixiong on 2018/10/25.
//  Copyright © 2018年 xiongli. All rights reserved.
//

#import "CustomItem.h"
#import <Masonry.h>
@interface CustomItem()
@property(nonatomic,strong)UILabel * rlabel;
@end

@implementation CustomItem



- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    self.backgroundColor = UIColor.lightGrayColor;
    
    _rlabel = [[UILabel alloc]init];
    _rlabel.textColor = UIColor.redColor;
    [self addSubview:_rlabel];
    [_rlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.width.equalTo(@200);
      
        make.centerX.equalTo(self);
    }];
    
    [_rlabel setFont:[UIFont systemFontOfSize:15]];
}

- (void)setContent:(NSString *)content{
    _content = content;
    [_rlabel setText:_content != nil ? _content : @"这是一段文本"];

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
