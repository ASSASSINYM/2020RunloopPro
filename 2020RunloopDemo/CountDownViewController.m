//
//  CountDownViewController.m
//  2020RunloopDemo
//
//  Created by ASSASSIN on 2020/9/13.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "CountDownViewController.h"
#import "ObserverViewController.h"

@interface CountDownViewController ()

@property(nonatomic,weak)IBOutlet UILabel *countdownLabel;

@property(nonatomic,assign)int seconds;

@property(nonatomic,strong)NSTimer *timer;

@end

@implementation CountDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

-(void)test {
      __block int seconds = 10000;
      
    
      
      self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
         seconds--;
        // NSLog(@"seconds = %d",seconds);
         int hours = seconds/(60 * 60.0);
         int min = (seconds - hours * 3600)/60.0;
         int sec = (seconds - hours * 3600 - min * 60);
         self.countdownLabel.text = [NSString stringWithFormat:@"%d时%d分%d秒",hours,min,sec];
         NSLog(@"%d-%d-%d",hours,min,sec);
         
         NSLog(@"-----小时-------%d",hours);
      }];
      
}

#pragma mark - ibaction

-(IBAction)push:(id)sender {
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ObserverViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"ObserverViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)dealloc {
    //[self.timer invalidate];
    NSLog(@"%s",__func__);
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
    NSLog(@"navi vcs -------%@",self.navigationController.viewControllers);
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%s",__func__);
}

@end
