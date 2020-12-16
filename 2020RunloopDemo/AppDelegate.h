//
//  AppDelegate.h
//  2020RunloopDemo
//
//  Created by ASSASSIN on 2020/8/16.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

