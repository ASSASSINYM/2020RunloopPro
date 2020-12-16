//
//  QueueViewController.m
//  2020RunloopDemo
//
//  Created by ASSASSIN on 2020/9/13.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "QueueViewController.h"

@interface QueueViewController ()

@end

@implementation QueueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    [self test2];
}

-(void)test2 {
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 5;
    
    dispatch_semaphore_t sem = dispatch_semaphore_create(1);
    
    for (int i = 0 ; i < 5; i++) {
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);

        NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
            [NSThread sleepForTimeInterval:5];
            NSLog(@"-----i---------= %d",i);
            dispatch_semaphore_signal(sem);
            //模拟一步任务
            //dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
//            NSBlockOperation *subOp = [NSBlockOperation blockOperationWithBlock:^{
//                dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
//                [NSThread sleepForTimeInterval:5];
//                NSLog(@"-------j-------- = fuck  i = %d",i);
//
//                dispatch_semaphore_signal(sem);
//            }];
           // [queue addOperation:subOp];
        }];
        [queue addOperation:op];
    }
    
}


-(void)test1 {
    dispatch_queue_t queue = dispatch_queue_create("fuckQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:5];
        NSLog(@"task1 + thread = %@",[NSThread currentThread]);
        
        dispatch_async(queue, ^{
            [NSThread sleepForTimeInterval:5];
            NSLog(@"task5+++++++++++++++++++++++++++");
        });
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:5];

         NSLog(@"task2 + thread = %@",[NSThread currentThread]);
     });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:5];

         NSLog(@"task3 + thread = %@",[NSThread currentThread]);

     });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:5];

         NSLog(@"task4 + thread = %@",[NSThread currentThread]);

     });
}


@end
