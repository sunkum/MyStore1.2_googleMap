//
//  AppDelegate.h
//  MyStore
//
//  Created by sunil on 1/5/15.
//  Copyright (c) 2015 sunil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;


@property (strong, nonatomic) UIWindow *window;

//- (void)saveContext;
//- (NSURL *)applicationDocumentsDirectory;


@end

