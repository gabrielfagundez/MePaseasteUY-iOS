//
//  MPUYMarkerDetailViewController.h
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 27/01/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MPUYMarkerDetailViewController : UIViewController

@property (strong, nonatomic) NSString *latitude;
@property (strong, nonatomic) NSString *longitude;
@property (strong, nonatomic) NSString *direction;
@property (strong, nonatomic) NSString *indexOfPoint;

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
