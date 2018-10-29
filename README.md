# JKGCDTimer
GCD定时器的封装

第1种使用方式(block返回执行的任务)

    // 导入，这个是封装的类名
    #import "JKGCDTimer.h"
    @property(nonatomic,strong) NSString *gcdTimerKeyName;
    // 第1种使用方式（Block里面做task）

    static int number = 0;
    /**
      task 定时器开启后执行的任务
      startTime 多长时间后开启任务
      intervalTime 时间间隔
      repeats 是否重复执行任务  YES: 重复  NO: 执行一次
      async 同步还是异步执行任务  YES:async(全局并发队列)  NO: sync(主队列)
     */
    self.gcdTimerKeyName = [JKGCDTimer execTask:^{

       number ++;
       NSLog(@"number==%d-------%@",number,[NSThread currentThread]);

    } startTime:2.0 intervalTime:1.0 repeats:YES async:YES];
 
 第2种使用方式(在自己的控制器里面的方法 实现任务)
 
    // 导入，这个是封装的类名
    #import "JKGCDTimer.h"
    @property(nonatomic,strong) NSString *gcdTimerKeyName;
    /**
      target 自己VC的 self
      selector 自己VC里面的 方法
      startTime 多长时间后开启任务
      intervalTime 时间间隔
      repeats 是否重复执行任务  YES: 重复  NO: 执行一次
      async 同步还是异步执行任务  YES:async(全局并发队列)  NO: sync(主队列)
    */

    self.gcdTimerKeyName = [JKGCDTimer execTaskTarget:self selector:@selector(timerExecTask) startTime:2.0 intervalTime:1.0 repeats:YES async:YES];

    #pragma mark 采用自己控制器执行任务的方法
    -(void)timerExecTask{

      static int number = 0;
      number ++;
      NSLog(@"number==%d-------%@",number,[NSThread currentThread]);

    }
