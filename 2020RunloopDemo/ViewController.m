//
//  ViewController.m
//  2020RunloopDemo
//
//  Created by ASSASSIN on 2020/8/16.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,assign)int index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self loop];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(300, 300, 100, 100)];
    [button setBackgroundColor:[UIColor greenColor]];
    [button addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    NSLog(@"%@",[NSThread currentThread]);
  //  [[NSThread currentThread] ge];
   // pthread_
    
    BOOL isMultiThread = [NSThread isMultiThreaded];
    NSLog(@"isMultiThread = %d",isMultiThread);
    
    [NSThread sleepForTimeInterval:5];
    NSLog(@"fuck it");
    
    [NSThread exit];
    
    NSLog(@"xxxxx");
    
    UIView *fuckView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    fuckView.backgroundColor = [UIColor redColor];
    [self.view addSubview:fuckView];
}

#pragma mark - btn clicked

-(void)btnClicked {
    NSLog(@"btn clicked");
}


-(void)loop {
    do {
        //NSLog(@"index--%d",self.index++);
    } while (1);
    
}


@end
