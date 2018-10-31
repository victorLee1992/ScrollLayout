//
//  TestController.m
//  ScrollLayoutDemo
//
//  Created by lixiong on 2018/10/25.
//  Copyright © 2018年 xiongli. All rights reserved.
//

#import "TestController.h"
#import "LXScrollLayout.h"
#import "CustomItem.h"
#import "ChangeHeightItem.h"
#import "AsynLoadItem.h"
#import "CallbackItem.h"
@implementation TestController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 改变视图中的值
    [self changeUIFromOutter];
}


- (void)changeUIFromOutter {
    // 比如通过网络请求，获得了值，要改变已经在controller上的子视图
    __block NSString * networkVlaue = nil;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        networkVlaue = @"这是一段从网络上获取的文本";
        dispatch_async(dispatch_get_main_queue(), ^{
            CustomItem * customItem = (CustomItem*)[self getTargetItemById:@"custom"];
            customItem.content = networkVlaue;
        });
    });
}


#pragma mark LXScrollLayoutProtocol 用来堆砌视图
- (void)constructItems {
    
    [LXBaseItemModel makeItemModel:^(LXBaseItemModel *model) {
        CustomItem * item1 = [[CustomItem alloc]init];
        item1.content = @"这是第一段简单的视图";
        model.bindItem(item1).bindId(@"custom").bindHeight(80);
        [self.items addObject:model];
    }];
    
    
    [LXBaseItemModel makeItemModel:^(LXBaseItemModel *model) {
        ChangeHeightItem * item2 = [[ChangeHeightItem alloc]init];
        model.bindItem(item2).bindId(@"change");
        [self.items addObject:model];
    }];
    
    [LXBaseItemModel makeItemModel:^(LXBaseItemModel *model) {
        AsynLoadItem * item3 = [[AsynLoadItem alloc]init];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [item3 loadContent:@"自动布局，创建好约束之后，每个页面有多个元素构成，只需要单独去关心每个元素自己的布局，通过链式语法的特性，更加的简洁，还可以view的回调统一通过block传回，代码可读性更强。"];
        });
        
        model.bindItem(item3).bindId(@"asynload");
        [self.items addObject:model];
    }];
    
    [LXBaseItemModel makeItemModel:^(LXBaseItemModel *model) {
        CallbackItem * item4 = [[CallbackItem alloc]init];
        model.bindItem(item4).bindHeight(100).bindId(@"callback").bindAction(^(id object){
            [self analysisCallbackValue:object];
        });
        [self.items addObject:model];
    }];
    
}


- (void)analysisCallbackValue :(id)value {
    NSString * result = value;
    NSLog(@"由子view传递的值为 %@",result);
    // do something
}


@end
