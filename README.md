# ScrollLayout

    一般来说，目前的iOS应用开发界面的内容都会超过一竖屏的内容，我们在应用当中必不可少的要用到scrollView来装载视图内容。那么问题来了，要做到好用有简单，当然需要一定的封装了，以下说的就是封装每一个页面使用scrollView来承载的模式。
    当然我们的页面的随着手机屏幕的变化，都是以屏幕的宽度随着手机来定，视图的高度按照固定间距得来（遇到有图片，需要按照宽高比来确定）。我们可以把视图上的每个元素都单独领出来，看成是一个item，从上到下有多个item堆砌而成。看上去似乎和我们所熟知的tableView很相似，但其实不然，tableView虽然也可以解决滑动和多个item并列装载的效果，但是确不够灵活，需要去实现各种代理的回调方法，每次都要写茫茫多的代理方法实在令人苦恼，而且效率也低。
    倒也不是说tableView的这个控件设计的不好，而且它主要被用来处理可以循环利用的视图，然而大多数情况下，很多视图并不能复用，这种时候如果再去使用cell的方式去罗列各种视图，就显得尤为笨拙，笔者几年前也试过将每一个item都使用tableViewCell的方式来构造，最后感觉浪费很多时间和精力去维护一个本来很简单的结构，得不偿失。
    接下来，就是要介绍这种使用scrollView来承载的方式了，将每一个item处理好就可以了，视图的统一布局在基类中已经做好了。
    
   介绍几个主要用到的类：
### 1.[LXBaseScrollController]()
    此类事vc的基类，处理了scrollView的子视图的由上而下布局问题，使用起来，只需要继承就可以了，以后会通过分类的方式来试下方便解耦。
 
### 2.[LXBaseItemModel]()
    这个类是最关键的，后续编码中虽然不需要去实现它的内容，确实用经常用到，它的作用就是视图item的一个管理器，糅合了data和controller之间的联系，可以通过设置它的一下属性来为item添加属性：
 
 ```objc
 
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
```
### 3. [LXBaseItem]()  
    此类事所有item的基类，只需要继承即可，里面简单添加了一个公共响应的点击事件，以及一个回调事件的block，这里考虑到代码的简洁性，没有使用delegate的方式

最后，用起来也很简单，只需要在继承viewController类实现 constructItems方法就可以了：
```objc
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
    
  }
  ```
