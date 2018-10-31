//
//  LXBaseItem.m
//  NearBaseFoundationDemo
//
//  Created by lixiong on 2018/8/1.
//  Copyright © 2018年 ZKJC. All rights reserved.
//

#import "LXBaseItem.h"

@implementation LXBaseItem


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}


-(void)createUI {
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tapGesture];
    
}

- (void)tapAction :(UITapGestureRecognizer *)sender{
    
    if (_enableTap != true && _itemBlock != nil) {
        _itemBlock(@"");
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
