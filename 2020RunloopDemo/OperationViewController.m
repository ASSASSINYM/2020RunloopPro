//
//  OperationViewController.m
//  2020RunloopDemo
//
//  Created by ASSASSIN on 2020/9/13.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "OperationViewController.h"

@interface OperationViewController ()

@property(nonatomic,assign)void(^fuckBlock)(int a);

@property(nonatomic,strong)CADisplayLink *disLink;

@end

@implementation OperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    self.disLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(task1)];
    [self.disLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    
}

- (void)printString:(NSString *)str
{
    NSLog(@"%@",str);
}

#pragma mark - invocation

-(void)test {
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task1) object:nil];
    [op start];
}

-(void)test1 {
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        [self task1];
    }];
    [op start];
}

-(void)task1 {
    static int i = 0;
    NSLog(@"-------i---------%d",i++);

}


#pragma mark - x

-(void)test2 {
    dispatch_semaphore_t sem = dispatch_semaphore_create(1);
    
    for (int i = 0; i < 5; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
            [[NSThread currentThread] setName:[NSString stringWithFormat:@"threadname+%d",i]];
            [NSThread sleepForTimeInterval:10];
            //NSLog(@"i = %d current thread = %@",i,[NSThread currentThread]);
            NSLog(@"i = %d",i);

            dispatch_semaphore_signal(sem);
        });
    }
}

-(void)test3 {
    
    void(^shitOnMe)(int a) = ^(int a) {
        NSLog(@"a = %d",a);
    };
    
    shitOnMe(11);
    
    self.fuckBlock = shitOnMe;
    
}


@end
