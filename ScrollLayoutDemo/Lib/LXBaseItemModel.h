//
//  LXBaseItemModel.h
//  NearBaseFoundationDemo
//
//  Created by lixiong on 2018/8/1.
//  Copyright © 2018年 ZKJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class LXBaseItem;

typedef void(^actionBlock)(id);

@interface LXBaseItemModel : NSObject


@property(nonatomic,strong) LXBaseItem *item;
@property(nonatomic,assign) CGFloat height;
@property(nonatomic,copy) NSString * item_id;
@property(nonatomic,strong) actionBlock action;

@property(nonatomic,assign)BOOL haveSetHeight;


- (LXBaseItemModel * (^)(LXBaseItem *))bindItem ;

- (LXBaseItemModel * (^)(CGFloat))bindHeight;

- (LXBaseItemModel * (^)(NSString *))bindId;

- (LXBaseItemModel * (^)(actionBlock))bindAction;

+ (void)makeItemModel : ( void(^)(LXBaseItemModel * model))block;

+ (LXBaseItemModel * (^)(void))makeItemModel;

@end
