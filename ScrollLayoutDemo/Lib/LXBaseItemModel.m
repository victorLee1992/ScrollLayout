//
//  LXBaseItemModel.m
//  NearBaseFoundationDemo
//
//  Created by lixiong on 2018/8/1.
//  Copyright © 2018年 ZKJC. All rights reserved.
//

#import "LXBaseItemModel.h"
#import "LXBaseItem.h"
@interface LXBaseItemModel()

    
@end

@implementation LXBaseItemModel


- (LXBaseItemModel *(^)(LXBaseItem *))bindItem {
    
    return ^(LXBaseItem * item) {
        self.item = item ;
        return self ;
    };
}

- (LXBaseItemModel *(^)(NSString *))bindId {
    
    return ^(NSString * item_id) {
        self.item_id = item_id;
        return self;
    };
}

- (LXBaseItemModel *(^)(CGFloat))bindHeight {
    
    return ^(CGFloat height) {
        self.height = height ;
        self.haveSetHeight = YES;
        return self;
    } ;
}

- (LXBaseItemModel *(^)(actionBlock))bindAction {
    
    return ^(actionBlock action) {
        self.action = action ;
        if (self.item != nil) {
            self.item.itemBlock = self.action ;
        }
        return self;
    };
}

// 创建一个实例

+ (void)makeItemModel:(void (^)(LXBaseItemModel *))block{
    
    LXBaseItemModel * model = [[LXBaseItemModel alloc]init];
    block(model);
    
}

+ (LXBaseItemModel *(^)(void))makeItemModel{
    
    return ^{
        LXBaseItemModel * model = [[LXBaseItemModel alloc]init];
        return model;
    };
    
}


@end
