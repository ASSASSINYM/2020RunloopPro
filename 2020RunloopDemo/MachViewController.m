//
//  MachViewController.m
//  2020RunloopDemo
//
//  Created by ASSASSIN on 2020/9/13.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "MachViewController.h"

@interface MachViewController ()<NSMachPortDelegate>

@end

@implementation MachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - port delegate

-(void)handlePortMessage:(NSPortMessage *)message {
    
}


@end
