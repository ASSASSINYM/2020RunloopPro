//
//  BlockViewController.m
//  2020RunloopDemo
//
//  Created by ASSASSIN on 2020/9/11.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   int (^block)(int) = ^(int a){
            NSLog(@"a:%d\n", a);
       return 88;
   };
    
   int result = block(10);
    NSLog(@"-result-%d\n",result);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
