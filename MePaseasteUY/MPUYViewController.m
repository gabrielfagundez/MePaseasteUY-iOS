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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated {
    [self setMapInitialRegion];
}

#pragma mark - Private Map Methods

- (void) setMapOptions {
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = YES;
}

- (void) setMapInitialRegion {
    MKCoordinateRegion region;
    region.center.latitude = [[self.mapModel initialLatitude] floatValue];
    region.center.longitude = [[self.mapModel initialLongitude] floatValue];
    region.span.latitudeDelta = [[self.mapModel mapSpanX] floatValue];
    region.span.longitudeDelta = [[self.mapModel mapSpanY] floatValue];
    
    [self.mapView setRegion:region animated:YES];
}

@end
