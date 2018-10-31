//
//  LXBaseScrollController.h
//  NearBaseFoundationDemo
//
//  Created by lixiong on 2018/8/1.
//  Copyright © 2018年 ZKJC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LXBaseItemModel;
@class LXBaseItem;
#import "LXScrollLayoutProtocol.h"

@interface LXBaseScrollController : UIViewController <LXScrollLayoutProtocol>

@property(nonatomic,strong,readonly)NSMutableArray<LXBaseItemModel *> * items;


// 通过itemModel的唯一id，查到到目标视图
- (LXBaseItem*)getTargetItemById:(NSString*)itemId;

@end
