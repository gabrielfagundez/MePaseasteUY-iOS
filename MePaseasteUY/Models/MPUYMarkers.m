//
//  MPUYMarkers.m
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 26/01/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import "MPUYMarkers.h"

@implementation MPUYMarkers

- (void) addMarker: (float)latitude :(float)longitude{
    // If neccesary, initialize the array
    if (self.markersArray == nil){
        self.markersArray = [[NSMutableArray alloc] init];
    };
    
    NSDictionary *marker = [[NSDictionary alloc]
                            initWithObjectsAndKeys:
                                [NSNumber numberWithFloat:latitude], @"latitude",
                                [NSNumber numberWithFloat:longitude], @"longitude", nil];
    
    [self.markersArray addObject:marker];
    
};

- (void) resetMarkers{
    
};

@end
