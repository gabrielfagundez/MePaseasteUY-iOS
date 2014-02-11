//
//  MPUYMarkerTableViewCell.h
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 27/01/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPUYMarkerTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *markerGeocodedLocation;
@property (weak, nonatomic) IBOutlet UILabel *markerLatitudeLongitude;

@end
