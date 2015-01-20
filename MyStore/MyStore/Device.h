//
//  Device.h
//  MyStore
//
//  Created by sunil on 1/5/15.
//  Copyright (c) 2015 sunil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Device : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) NSString * company;

@end
