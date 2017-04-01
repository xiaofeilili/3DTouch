//
//  ViewController.m
//  0607_3D touch
//
//  Created by namibank on 16/6/7.
//  Copyright © 2016年 xiaofei. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ddd";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    if (!([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)) {
        if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你的手机支持3d touch" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        }else {
            NSLog(@"buzhichi");
            [[NSUserDefaults standardUserDefaults] setObject:@"不支持" forKey:@"3D touch"];
        }
    }else {
        [[NSUserDefaults standardUserDefaults] setObject:@"不支持" forKey:@"3D touch"];
    }
    
    NSLog(@"在vc里");
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 40);
    btn.backgroundColor = [UIColor cyanColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick {
    FirstViewController *first = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:first animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"buzhichi");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
