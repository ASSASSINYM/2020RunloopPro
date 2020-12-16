//
//  NSObjectViewController.m
//  2020RunloopDemo
//
//  Created by ASSASSIN on 2020/9/11.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "NSObjectViewController.h"

@interface NSObjectViewController ()

@end

@implementation NSObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSThread *thread = [[NSThread alloc] init];
    //[thread ];
    thread.name = @"mtsubThread";
    [self performSelector:@selector(doWork) onThread:thread withObject:nil waitUntilDone:YES];
    //[thread start];
   // [NSThread detachNewThreadSelector:@selector(doWork) toTarget:self withObject:nil];
    
   // [NSThread ta];
}

#pragma mark - do on main thread

-(void)updateUI {
    
    NSLog(@"更新 UI\n");
    NSLog(@"当前线程-%@\n",[NSThread currentThread]);
}

#pragma mark - do

-(void)doWork {
    
    [NSRunLoop currentRunLoop];
    
    NSLog(@"子线程执行任务！\n");
    NSLog(@"当前线程-%@\n",[NSThread currentThread]);
    sleep(10);
    
    [self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:YES];
}

@end
