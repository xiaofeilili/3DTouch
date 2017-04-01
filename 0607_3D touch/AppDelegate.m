//
//  AppDelegate.m
//  0607_3D touch
//
//  Created by namibank on 16/6/7.
//  Copyright © 2016年 xiaofei. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/** 若在Info.plist中添加 添加以下：(每个app最大支持四个Action Item) */

/**
 <key>UIApplicationShortcutItems</key>
 
 <array>
 
 <dict>
 
 <key>UIApplicationShortcutItemIconFile</key>
 
 <string>open-favorites</string>
 
 <key>UIApplicationShortcutItemTitle</key>
 
 <string>Favorites</string>
 
 <key>UIApplicationShortcutItemType</key>
 
 <string>com.mycompany.myapp.openfavorites</string>
 
 <key>UIApplicationShortcutItemUserInfo</key>
 
 <dict>
 
 <key>key1</key>
 
 <string>value1</string>
 
 </dict>
 
 </dict>
 
 <dict>
 
 <key>UIApplicationShortcutItemIconType</key>
 
 <string>UIApplicationShortcutIconTypeCompose</string>
 
 <key>UIApplicationShortcutItemTitle</key>
 
 <string>New Message</string>
 
 <key>UIApplicationShortcutItemType</key>
 
 <string>com.mycompany.myapp.newmessage</string>
 
 <key>UIApplicationShortcutItemUserInfo</key>
 
 <dict>
 
 <key>key2</key>
 
 <string>value2</string>
 
 </dict>
 
 </dict>
 
 </array>
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ViewController *rootVC = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootVC];
    self.window.rootViewController = nav;
    
//    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你的手机支持3d touch" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//        [alert show];
//    }else {
//        NSLog(@"buzhichi");
//    }
    
    NSLog(@"DieFinish");
    
    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    //    NSArray *arr = @[@"hello 3D touch"];
    //    UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:arr applicationActivities:nil];
    //        [self.window.rootViewController presentViewController:vc animated:YES completion:^{
    //
    //        }];
    /** 逻辑判断 */
    if ([shortcutItem.type isEqualToString:@"item1"]) {
        /** 具体操作 */
        NSLog(@"ddd");
        FirstViewController *vc = [[FirstViewController alloc] init];

        UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
        [nav pushViewController:vc animated:YES];
        NSLog(@"%@",self.window.rootViewController);
        
    }else if ([shortcutItem.type isEqualToString:@"item2"]) {
        NSLog(@"点击了第二个");
        SecondViewController *second = [[SecondViewController alloc] init];
        UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
        [nav pushViewController:second animated:YES];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {  //即将进入后台
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"dffsfgdsfd");
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:@"3D touch"] isEqualToString:@"不支持"]) {
        /** 定义shortcutItem */
        UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@""];
        
        /** type 该item 唯一标示符
         localizedTitle: 标题
         localizedSubtitle: 副标题
         icon: icon图标 可以使用系统类型，也可以使用自定义图片
         userInfo: 用户信息字典， 自定义参数，完成具体功能需求
         */
        UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"item1" localizedTitle:@"一一" localizedSubtitle:@"111" icon:icon1 userInfo:nil];
        
        UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd];
        UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"item2" localizedTitle:@"二二" localizedSubtitle:@"222" icon:icon2 userInfo:nil];
        
        application.shortcutItems = @[item1, item2];
    }
    
    NSLog(@"在delegate里");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"BecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
