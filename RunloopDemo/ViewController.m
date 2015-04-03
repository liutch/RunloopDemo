//
//  ViewController.m
//  RunloopDemo
//
//  Created by Tyler on 15/4/3.
//  Copyright (c) 2015年 Tyler. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CFRunLoopRef currentLoop;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    [button setBackgroundColor:[UIColor blueColor]];
    [button setTitle:@"abc" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button setBackgroundColor:[UIColor blueColor]];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

- (void)click:(id)sender{
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(playerThread:) object:nil];
    [thread start];
}

- (void)playerThread:(id)unused{
    currentLoop = CFRunLoopGetCurrent();
    
    [self initPlayer];
    
    CFRunLoopRun();
}

- (void)initPlayer{
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(checkState:) userInfo:nil repeats:YES];
}

- (void)checkState:(NSTimer*)timer{
    for (int i=0; i<100; i++) {
        NSLog(@"%d",i);
    }
//    CFRunLoopStop(currentLoop);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
