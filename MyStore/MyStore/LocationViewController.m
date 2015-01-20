//
//  LocationViewController.m
//  MyStore
//
//  Created by sunil on 1/13/15.
//  Copyright (c) 2015 sunil. All rights reserved.
//

#import "LocationViewController.h"
#import "MapViewController.h"

@interface LocationViewController ()
- (IBAction)submit:(id)sender;

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    MapViewController *map = [segue destinationViewController];
    map.locationAddress = _address.text;
    map.locationLongitude = [_longitude.text floatValue];
    map.locationLatitude = [_latitude.text floatValue];
    
   // MapViewController *map = [segue destinationViewController];
   // map.labelString = _address.text;
    
    
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

- (IBAction)submit:(id)sender {
}
@end
