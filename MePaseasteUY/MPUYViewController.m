//
//  MPUYViewController.m
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 26/01/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import "MPUYViewController.h"
#import "MPUYMap.h"

@interface MPUYViewController ()

@end

@implementation MPUYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Map Model, encapsulate specific behavior
    self.mapModel = [[MPUYMap alloc] init];

    // Set initial map options
    [self setMapOptions];
    
    // Set gesture recognizion
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addMarkerToCurrentTouch:)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    [self.mapView addGestureRecognizer:tapRecognizer];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) viewDidAppear:(BOOL)animated {
    [self setMapInitialRegion];
}




#pragma mark - Private Map Methods

- (void) setMapOptions {
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = YES;
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

-(IBAction)addMarkerToCurrentTouch:(UITapGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:self.mapView];
    CLLocationCoordinate2D tapPoint = [self.mapView convertPoint:point toCoordinateFromView:self.view];
    
    MKPointAnnotation *recognizedPoint = [[MKPointAnnotation alloc] init];
    recognizedPoint.coordinate = tapPoint;
    
    [self.mapView addAnnotation:recognizedPoint];
}

@end
