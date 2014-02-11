//
//  MPUYMarkerDetailViewController.m
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 27/01/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import "MPUYMarkerDetailViewController.h"


@interface MPUYMarkerDetailViewController ()

@end

@implementation MPUYMarkerDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set initial map options
    [self setMapInitialRegion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated {
    [self setMapInitialRegion];
    [self addMarkerToSelectedLocation];
}

#pragma mark - Private Map Methods
- (void) setMapOptions {
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = NO;
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:NO];
    [self.mapView setScrollEnabled:NO];
}

- (void) setMapInitialRegion {
    
    // Set initial region
    MKCoordinateRegion region;
    region.center.latitude = [self.latitude floatValue];
    region.center.longitude = [self.longitude floatValue];
    region.span.latitudeDelta = 0.01;
    region.span.longitudeDelta = 0.01;
    
    [self.mapView setRegion:region animated:YES];
}

- (void) addMarkerToSelectedLocation {
    
    // Add annotation to the map
    CLLocationCoordinate2D point;
    point.latitude = self.latitude.doubleValue;
    point.longitude = self.longitude.doubleValue;
    
    MKPointAnnotation *recognizedPoint = [[MKPointAnnotation alloc] init];
    recognizedPoint.coordinate = point;
    
    [self.mapView addAnnotation:recognizedPoint];
    
}

@end
