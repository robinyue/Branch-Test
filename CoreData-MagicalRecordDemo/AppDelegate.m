//
//  AppDelegate.m
//  CoreData-MagicalRecordDemo
//
//  Created by Robin_Long on 15/12/3.
//  Copyright © 2015年 岳小龙. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreData+MagicalRecord.h>
#import "News.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"%@",NSHomeDirectory());
    //创建一个数据库
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"Robin.db"];
    News *new = [News MR_createEntity];
    new.name = @"新浪新闻";
    //把数据保存到数据库
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    NSArray *allNews = [News MR_findAll];
    
    for (News *new in allNews) {
        NSLog(@"%@",new.name);
    }
    
    NSLog(@"%@",allNews);
    
    //查询某个属性
    NSArray *allSinaNews = [News MR_findByAttribute:@"name" withValue:@"新浪新闻"];
    for (News *new in allSinaNews) {
        NSLog(@"新浪 == %@",new.name);
        new.name = @"腾讯新闻";
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
