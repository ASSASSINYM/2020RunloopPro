//
//  WaveViewController.m
//  2020RunloopDemo
//
//  Created by ASSASSIN on 2020/9/13.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "WaveViewController.h"

@interface WaveViewController ()

@property(nonatomic,strong)CADisplayLink* displayLink;

@property(nonatomic,strong)CAShapeLayer *sinShape;

@end

@implementation WaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(drawLine)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    shape.frame = CGRectMake(0, 0, 200, 200);
    shape.fillColor = [UIColor redColor].CGColor;
    shape.strokeColor = [UIColor greenColor].CGColor;
    shape.lineWidth = 5;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    shape.path = path.CGPath;
    
    [self.view.layer addSublayer:shape];
    
    
    
    
}

#pragma mark - draw line

-(void)drawLine {
    

    [_sinShape removeFromSuperlayer];
    
    static int speed = 0;
    speed = speed + 10;
    
     CGPoint origin = CGPointMake(0 + speed, 50);
     
     UIBezierPath *wavePath = [UIBezierPath bezierPath];
    // wavePath.lineWidth = 10;
     //[UIColor redColor];
     //[wavePath stroke];
     
     [wavePath moveToPoint:origin];
     
    self.sinShape = [[CAShapeLayer alloc] init];
    _sinShape.frame = CGRectMake(0, 300, self.view.bounds.size.width, 100);
    _sinShape.strokeColor = [UIColor redColor].CGColor;
    _sinShape.fillColor = [UIColor whiteColor].CGColor;
    _sinShape.lineWidth = 3;
     
     for (int i = 0; i < self.view.bounds.size.width; i++) {
         int x = i + speed;
         int y = 100 * sin((M_PI_2/20) * i + speed);
         [wavePath addLineToPoint:CGPointMake(x, y)];
         NSLog(@"%@",[NSValue valueWithCGPoint:CGPointMake(x, x)]);
     }
     
    
    _sinShape.path = wavePath.CGPath;
     
    [self.view.layer addSublayer:_sinShape];
}


@end
