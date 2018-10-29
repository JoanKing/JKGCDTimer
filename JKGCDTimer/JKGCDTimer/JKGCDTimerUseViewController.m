//
//  JKGCDTimerUseViewController.m
//  JKGCDTimer
//
//  Created by 王冲 on 2018/10/29.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "JKGCDTimerUseViewController.h"
#import "JKGCDTimer.h"
@interface JKGCDTimerUseViewController ()

@property(nonatomic,strong) NSString *gcdTimerKeyName;

@end

@implementation JKGCDTimerUseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 50, 50)];
    [btn1 setTitle:@"暂停" forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor brownColor]];
    btn1.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn1 addTarget:self action:@selector(pauseGCDTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(btn1.frame)+50, 50, 50)];
    [btn2 setTitle:@"开始" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor brownColor]];
    btn2.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn2 addTarget:self action:@selector(resumeGCDTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    // 第1种使用方式（Block里面做task）
    /*
     static int number = 0;
     self.gcdTimerKeyName = [JKGCDTimer execTask:^{
     
     number ++;
     NSLog(@"number==%d-------%@",number,[NSThread currentThread]);
     
     } startTime:2.0 intervalTime:1.0 repeats:YES async:YES];
     */
    
    // 第2种使用方式（Block里面做task）
    self.gcdTimerKeyName = [JKGCDTimer execTaskTarget:self selector:@selector(timerExecTask) startTime:2.0 intervalTime:1.0 repeats:YES async:YES];
}

#pragma mark 取消定时器
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [JKGCDTimer canleGCDTimerTask:self.gcdTimerKeyName];
}

#pragma mark 采用自己控制器执行任务的方法
-(void)timerExecTask{
    
    static int number = 0;
    number ++;
    NSLog(@"number==%d-------%@",number,[NSThread currentThread]);
    
}

#pragma mark 暂停GCD定时器
-(void)pauseGCDTimer{
    
    [JKGCDTimer pauseGCDTimerTask:self.gcdTimerKeyName];
}

#pragma mark  重新开启GCD定时器
-(void)resumeGCDTimer{
    
    [JKGCDTimer resumeGCDTimerTask:self.gcdTimerKeyName];
}

#pragma mark 离开销毁控制器
-(void)dealloc{
    
    [JKGCDTimer canleGCDTimerTask:self.gcdTimerKeyName];
}

@end
