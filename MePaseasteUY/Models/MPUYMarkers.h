//
//  MPUYMarkers.h
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 26/01/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPUYMarkers : NSObject

@property (strong, nonatomic) NSMutableArray *markersArray;
@property (strong, nonatomic) NSMutableArray *directionsArray;

- (void) addMarker: (float)latitude: (float)longitude;
- (void) addDirection: (NSString *) direction;
- (void) resetMarkers;
+ (NSString *) formattedPosition: (NSString *)latitude: (NSString *)longitude;

@end
