//
//  MPUYViewController.h
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 26/01/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class MPUYMap;
@class MPUYMarkers;

@interface MPUYViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) MPUYMap * mapModel;
@property (strong, nonatomic) MPUYMarkers * markersModel;

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
