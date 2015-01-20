//
//  LocationViewController.h
//  MyStore
//
//  Created by sunil on 1/13/15.
//  Copyright (c) 2015 sunil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UITextField *latitude;

@end
