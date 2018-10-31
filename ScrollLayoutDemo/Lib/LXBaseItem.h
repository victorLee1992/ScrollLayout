//
//  LXBaseItem.h
//  NearBaseFoundationDemo
//
//  Created by lixiong on 2018/8/1.
//  Copyright © 2018年 ZKJC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXBaseItem : UIView

@property(nonatomic,assign)BOOL enableTap ;
@property(nonatomic,strong)void(^itemBlock)(id) ;

@end
