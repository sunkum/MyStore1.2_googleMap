//
//  DeviceDetailViewController.h
//  MyStore
//
//  Created by sunil on 1/5/15.
//  Copyright (c) 2015 sunil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *versionTextField;

@property (weak, nonatomic) IBOutlet UITextField *companyTextField;

- (IBAction)cancel:(id)sender;


- (IBAction)save:(id)sender;

//- (IBAction)save:(id)sender;
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancel;

@end
