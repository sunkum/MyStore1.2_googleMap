//
//  MapViewController.m
//  MyStore
//
//  Created by sunil on 1/13/15.
//  Copyright (c) 2015 sunil. All rights reserved.
//

#import "MapViewController.h"



@interface MapViewController ()



@end

@implementation MapViewController




-(void)viewDidAppear:(BOOL)animated {
 CLLocationCoordinate2D poiCo;
 //NSLog(@"in map view = %f", poi.longitude);
 
 poiCo.longitude = _locationLongitude ;
 poiCo.latitude =_locationLatitude;
 MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(poiCo, 750, 750);
 [self.mapView setRegion:viewRegion animated:YES];
 
 
 
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
   // _labelTextField.text = _labelString;
  /*
    CLLocationCoordinate2D poiCo;
    //NSLog(@"in map view = %f", poi.longitude);
    
    poiCo.longitude = _locationLongitude ;
    poiCo.latitude =_locationLatitude;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(poiCo, 750, 750);
    [self.mapView setRegion:viewRegion animated:YES]; */
    
    
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
