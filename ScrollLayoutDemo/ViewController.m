//
//  ViewController.m
//  ScrollLayoutDemo
//
//  Created by lixiong on 2018/10/25.
//  Copyright © 2018年 xiongli. All rights reserved.
//

#import "ViewController.h"
#import "TestController.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)letsGoAction:(id)sender {
    
    [self.navigationController pushViewController:[TestController new] animated:true];
    
}

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
