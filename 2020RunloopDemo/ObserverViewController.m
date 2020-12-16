//
//  ObserverViewController.m
//  2020RunloopDemo
//
//  Created by ASSASSIN on 2020/9/13.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "ObserverViewController.h"


@interface ObserverViewController ()

@property(nonatomic,weak)IBOutlet UILabel *countdownLabel;
@property(nonatomic,weak)NSTimer *timer;

@end

@implementation ObserverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    [self test];
    
   // [[NSRunLoop currentRunLoop] ];
}


-(void)test {
      __block int seconds = 10000;
      
    

    
    __weak typeof(self) weakself = self;
      
      self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
         seconds--;
        // NSLog(@"seconds = %d",seconds);
         int hours = seconds/(60 * 60.0);
         int min = (seconds - hours * 3600)/60.0;
         int sec = (seconds - hours * 3600 - min * 60);
         weakself.countdownLabel.text = [NSString stringWithFormat:@"%d时%d分%d秒",hours,min,sec];
        NSLog(@"%d-%d-%d",hours,min,sec);
         
        NSLog(@"-----小时-------%d",hours);
      }];
      
}


-(void)dealloc {
    [self.timer invalidate];
    NSLog(@"%s",__func__);
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
    NSLog(@"navi vcs ---++++++%@",self.navigationController.viewControllers);
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%s",__func__);
}


@end
