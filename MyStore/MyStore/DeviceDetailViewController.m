//
//  DeviceDetailViewController.m
//  MyStore
//
//  Created by sunil on 1/5/15.
//  Copyright (c) 2015 sunil. All rights reserved.
//

#import "DeviceDetailViewController.h"
#import "Device.h"

@interface DeviceDetailViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameXContraint;

@end

@implementation DeviceDetailViewController


- (NSManagedObjectContext*)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (IBAction)cancel:(id)sender {
//}

//- (IBAction)save:(id)sender {
//}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
//    
//    [newDevice setValue:self.nameTextField.text forKey:@"name"];
//    [newDevice setValue:self.versionTextField.text forKey:@"version"];
//    [newDevice setValue:self.companyTextField.text forKey:@"company"];
//    

    
    //NSError *error = nil;
    // Save the object to persistent store
   // if (![context save:&error]) {
      //  NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    //}
    
    // NSString *p = @"sunilkuma";
   // [newDevice setValue:p.description forKey:@"name"];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
