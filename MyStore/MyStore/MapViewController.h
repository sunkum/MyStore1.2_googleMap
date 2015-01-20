//
//  MapViewController.h
//  MyStore
//
//  Created by sunil on 1/13/15.
//  Copyright (c) 2015 sunil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit.h"
#import "Location.h"

@interface MapViewController : UIViewController
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

//@property Location * locMap;

@property NSString * locationAddress;
@property double locationLongitude;
@property double locationLatitude;

/*@property (weak, nonatomic) IBOutlet UILabel *labelTextField;

@property NSString *labelString; */

@end
