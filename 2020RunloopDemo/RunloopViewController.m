//
//  RunloopViewController.m
//  2020RunloopDemo
//
//  Created by ASSASSIN on 2020/9/13.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "RunloopViewController.h"

@interface RunloopViewController ()

@property(nonatomic,strong)NSThread *downloadThread;

@end

@implementation RunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
   // [self test4];
    
    [self performSelector:@selector(fuckTask) onThread:self.downloadThread withObject:nil waitUntilDone:YES];
    
    [self performSelector:@selector(fuckTask) onThread:self.downloadThread withObject:nil waitUntilDone:YES];
    
    [self performSelector:@selector(fuckTask) onThread:self.downloadThread withObject:nil waitUntilDone:YES];
    
        
    
    [self performSelector:@selector(fuckTask) onThread:self.downloadThread withObject:nil waitUntilDone:YES];
    

    

//
//    CFRunLoopObserverCreate(<#CFAllocatorRef allocator#>, <#CFOptionFlags activities#>, <#Boolean repeats#>, <#CFIndex order#>, <#CFRunLoopObserverCallBack callout#>, <#CFRunLoopObserverContext *context#>)
}

-(void)test1 {
    __block int i = 0;
     
     NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
         i++;
         NSLog(@"---------%d",i);
     }];
     [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
     //[NSThread exit];
     //[timer fire];
}

-(void)test2 {
    
    __block int i = 0;
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        i++;
        NSLog(@"--------%ld",i);
    }];
}

-(void)test3 {
    
    
    
    NSTimer * timer = [NSTimer timerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
        static int count = 0;
        [NSThread sleepForTimeInterval:2];
        //休息一秒钟，模拟耗时操作
        NSLog(@"%s - %d",__func__,count++);
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)test4 {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            static int count = 0;
            [NSThread sleepForTimeInterval:2];
            NSLog(@"count = %d",count++);
        }];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] run];
    });
}

#pragma mark - getter

-(NSThread *)downloadThread {
    if (!_downloadThread) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _downloadThread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadTask) object:nil];
            [_downloadThread start];
        });
    }
    return _downloadThread;
}

-(void)downloadTask {
    @autoreleasepool {
        [[NSThread currentThread] setName:@"downloadThread"];
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runloop run];
    }
}

-(void)fuckTask {
    static int i = 0;
    NSLog(@"-----%d",i++);
    NSLog(@"----currentThread---------%@",[NSThread currentThread].name);
}

@end
