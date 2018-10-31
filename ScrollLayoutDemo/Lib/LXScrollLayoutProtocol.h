//
//  LXScrollLayoutProtocol.h
//  ScrollLayoutDemo
//
//  Created by lixiong on 2018/10/25.
//  Copyright © 2018年 xiongli. All rights reserved.
//

#ifndef LXScrollLayoutProtocol_h
#define LXScrollLayoutProtocol_h


@protocol LXScrollLayoutProtocol <NSObject>

@required
-(void)constructItems;
@optional
-(void)layoutItems;

@end



#endif /* LXScrollLayoutProtocol_h */
