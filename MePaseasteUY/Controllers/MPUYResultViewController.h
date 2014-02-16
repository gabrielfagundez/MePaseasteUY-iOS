//
//  MPUYResultViewController.h
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 11/02/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class MPUYMap;

@interface MPUYResultViewController : UIViewController {
    UIActivityIndicatorView *spinner;
}

@property (strong, nonatomic) MPUYMap * mapModel;
@property (strong, nonatomic) NSArray * markersArray;
@property (nonatomic, retain) UIActivityIndicatorView * spinner;
@property (weak, nonatomic) IBOutlet UIButton *detailsView;

@property (nonatomic, retain) IBOutlet MKMapView * mapView;
@property (nonatomic, retain) IBOutlet UIImageView * imageView;
@property (strong, nonatomic) IBOutlet UILabel * labelCosto;
@property (strong, nonatomic) IBOutlet UILabel * labelCantTaxis;
@property (strong, nonatomic) IBOutlet UILabel * labelDestinos;

@end
