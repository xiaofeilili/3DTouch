//
//  DetailViewController.m
//  0607_3D touch
//
//  Created by xiaofei on 2017/12/22.
//  Copyright © 2017年 xiaofei. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    // Do any additional setup after loading the view.
    
    UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    centerLabel.center = self.view.center;
    centerLabel.text = @"哈哈哈";
    [self.view addSubview:centerLabel];
}

//设置控制器在弹窗时候 上拉,出现类似ActionSheet的下面输出的数组
-(NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    //弹出的第一个按钮
    UIPreviewAction *action0 = [UIPreviewAction actionWithTitle:@"action0" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"%s, line = %d, action0 = %@, previewViewController = %@", __FUNCTION__, __LINE__, action, previewViewController);
        
    }];
    
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"action1" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"%s, line = %d, action1 = %@, previewViewController = %@", __FUNCTION__, __LINE__, action, previewViewController);
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"action2" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"%s, line = %d, action2 = %@, previewViewController = %@", __FUNCTION__, __LINE__, action, previewViewController);
    }];
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"action3" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"%s, line = %d, action2 = %@, previewViewController = %@", __FUNCTION__, __LINE__, action, previewViewController);
    }];
    
    //该按钮可以是一个组,点击该组时,跳到组里面的按钮.
    UIPreviewActionGroup *actionGroup = [UIPreviewActionGroup actionGroupWithTitle:@"actionGroup" style:UIPreviewActionStyleSelected actions:@[action2, action3]];
    //直接返回数组.
    return  @[action0,action1,actionGroup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
