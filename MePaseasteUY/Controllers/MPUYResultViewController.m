//
//  MPUYResultViewController.m
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 11/02/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import "MPUYResultViewController.h"
#import "MPUYMap.h"
#import "MPUYAppDelegate.h"

@interface MPUYResultViewController ()

@end

@implementation MPUYResultViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setMarkersArrayFromDelegate];
    
    // Initialize classes
    self.mapModel = [[MPUYMap alloc] init];
        
    // Set initial map options
    [self setMapOptions];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated {
    [self addMarkers];
    [self setMapInitialRegion];
}

#pragma mark - Private Map Methods
- (void) setMapOptions {
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = NO;
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];
}


- (void) setMapInitialRegion {
    MKCoordinateRegion region;
    region.center.latitude = [[self.mapModel initialLatitude] floatValue];
    region.center.longitude = [[self.mapModel initialLongitude] floatValue];
    region.span.latitudeDelta = [[self.mapModel mapSpanX] floatValue];
    region.span.longitudeDelta = [[self.mapModel mapSpanY] floatValue];
    
    [self.mapView setRegion:region animated:YES];
}

- (void) addMarkers {
    
    int i=0;
    for (i = 0; i < [self.markersArray count]; i++)
    {
        NSString *latitude = [[self.markersArray objectAtIndex:i] objectForKey:@"latitude"];
        NSString *longitude = [[self.markersArray objectAtIndex:i] objectForKey:@"longitude"];
        
        CLLocationCoordinate2D point;
        point.latitude = latitude.doubleValue;
        point.longitude = longitude.doubleValue;
        
        MKPointAnnotation *recognizedPoint = [[MKPointAnnotation alloc] init];
        recognizedPoint.coordinate = point;
        
        [self.mapView addAnnotation:recognizedPoint];
    }
}

#pragma mark - Private markers methods
- (void) setMarkersArrayFromDelegate {
    
    // We take the array from the app delegate
    MPUYAppDelegate *appDelegate = (MPUYAppDelegate*) [UIApplication sharedApplication].delegate;
    self.markersArray = appDelegate.markers;
    
}

@end
