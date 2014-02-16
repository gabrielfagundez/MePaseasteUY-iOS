//
//  MPUYMarkersViewController.h
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 27/01/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MPUYMarkers;

@interface MPUYMarkersViewController : UITableViewController {
    UIActivityIndicatorView *spinner;
}

@property (strong, nonatomic) NSArray * markersArray;
@property(nonatomic,retain) UIActivityIndicatorView *spinner;
@property (strong, nonatomic) MPUYMarkers * markersModel;

@end
