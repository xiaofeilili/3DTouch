//
//  ViewController.m
//  0607_3D touch
//
//  Created by namibank on 16/6/7.
//  Copyright © 2016年 xiaofei. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "DetailViewController.h"

// NamiBank.-607-3D-touch

@interface ViewController ()<UIViewControllerPreviewingDelegate>        // 遵守协议

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ddd";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
#pragma mark    ----判断是否支持3DTouch
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
    // 给按钮长按加3DTouch功能
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:self sourceView:btn];
    }
}

- (void)btnClick {
    FirstViewController *first = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:first animated:YES];
}

#pragma mark    ----UIViewControllerPreviewingDelegate
// 当中度按压时调用该方法
- (nullable UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    UIButton *btn = (UIButton *)[previewingContext sourceView];
    [previewingContext setSourceRect:btn.bounds];
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    //设置弹出peek的高度(设置宽度是没有效果的)
    detailVC.preferredContentSize = CGSizeMake(0, 500);
    
//    return [[UINavigationController alloc] initWithRootViewController:detailVC];
    return detailVC;
}
// 弹框出现后，继续重按时调用
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
//    UINavigationController *nav = (UINavigationController *)viewControllerToCommit;
//    DetailViewController *detailVC = nav.viewControllers.lastObject;
    DetailViewController *detailVC = (DetailViewController *)viewControllerToCommit;
    [self showViewController:detailVC sender:self];
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
