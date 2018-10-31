//
//  LXBaseScrollController.m
//  NearBaseFoundationDemo
//
//  Created by lixiong on 2018/8/1.
//  Copyright © 2018年 ZKJC. All rights reserved.
//

#import "LXBaseScrollController.h"
#import "LXBaseItemModel.h"
#import "LXBaseItem.h"
#import <Masonry.h>
@interface LXBaseScrollController ()

@property(nonatomic,strong) UIScrollView * uiScrollView;
@property(nonatomic,strong) UIView * uiContentView;
@property(nonatomic,strong) NSMutableArray<LXBaseItemModel*> * items;

@end

@implementation LXBaseScrollController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    _items = [[NSMutableArray alloc]init];
    __weak typeof (self) weakSelf = self ;
    
    [self.view addSubview:self.uiScrollView];
    [_uiScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
        make.width.equalTo(weakSelf.view);
    }];
    
    [_uiScrollView addSubview:self.uiContentView];
    _uiScrollView.alwaysBounceVertical = true;
    [_uiContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weakSelf.uiScrollView);
        make.edges.equalTo(weakSelf.uiScrollView);
//        make.top.left.right.bottom.equalTo(weakSelf.uiScrollView);
    }];
    
    // 子类实现协议的 2个方法，分别填充视图元素和布局操作
    if ([self respondsToSelector:@selector(constructItems)] ){
        [self constructItems];
        [self layoutItems];
    }
    
    // Do any additional setup after loading the view.
}

- (UIScrollView*)uiScrollView{
    if (_uiScrollView == nil) {
        _uiScrollView = [[UIScrollView alloc]init];
        _uiScrollView.backgroundColor = UIColor.whiteColor;
    }
    return _uiScrollView;
}

- (UIView*)uiContentView{
    if (_uiContentView == nil) {
        _uiContentView = [[UIView alloc] init];
    }
    return _uiContentView;
}
// 布局视图中的各个组件
- (void)layoutItems {
    
    if (_items.count == 0) {
        return;
    }
    __weak typeof (self) weakSelf = self ;

    UIView * superView = weakSelf.uiContentView;
    UIView * __block lastView = nil;
    for (LXBaseItemModel * temp in _items) {
        [superView addSubview:temp.item];
        [temp.item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastView != nil ? lastView.mas_bottom : superView);
            make.left.right.equalTo(superView);
            if (temp.haveSetHeight == YES) {
                make.height.mas_equalTo(temp.height);
            }
            else{
                // 没有约束高度的话，高度由 它 内部的元素来决定 （体现在bottm约束）
            }
            lastView = temp.item;
        }];
    }
    // 最后，将承载的视图contentView 的bottom设置约束，获得最后的高度
    [_uiContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView);
    }];
}

- (void)constructItems {
    // 需要自己去添加，视图中每一个ItemModel元素，由子类实现
}

- (LXBaseItem*)getTargetItemById:(NSString*)itemId {
    if (self.items.count == 0 || itemId == nil) {
        return nil;
    }
    for (LXBaseItemModel * temp in self.items) {
        if ([temp.item_id isEqualToString:itemId]) {
            return temp.item;
        }
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
