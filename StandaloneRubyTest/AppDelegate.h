//
//  AppDelegate.h
//  StandaloneRubyTest
//
//  Created by eralp on 8/1/13.
//  Copyright (c) 2013 SuperDamage. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "MasterViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (nonatomic,strong) IBOutlet MasterViewController *masterViewController;
@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
