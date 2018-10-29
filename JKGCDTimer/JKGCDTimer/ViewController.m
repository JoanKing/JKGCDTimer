//
//  ViewController.m
//  JKGCDTimer
//
//  Created by 王冲 on 2018/10/29.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "ViewController.h"
// JKGCDTimer 定时器封装的使用控制器
#import "JKGCDTimerUseViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"GCDTimer" style:UIBarButtonItemStylePlain target:self action:@selector(clickGCDTimer)];
    
}

#pragma mark JKGCDTimer 封装好的定时器的使用
-(void)clickGCDTimer{
    
    JKGCDTimerUseViewController *jkGCDTimerUseViewController = [JKGCDTimerUseViewController new];
    [self.navigationController pushViewController:jkGCDTimerUseViewController animated:YES];
}



@end

