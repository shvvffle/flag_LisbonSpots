//
//  AppDelegate.h
//  LisbonSpots
//
//  Created by Marina Marques on 03/05/17.
//  Copyright (c) 2017 Flag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


+ (AppDelegate*) sharedDelegate;
- (void)saveContext;


@end

