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

    NSLog(@"Latitud: %f", latitude);
    NSLog(@"Longitud: %f", longitude);
    
//    NSDictionary *marker = [[NSDictionary alloc] initWithObjectsAndKeys:@"value1", @"x", @"value2", @"y", nil];
//    NSLog([NSString stringWithFormat:@"%@", [marker objectForKey:@"x"]]);
    
};

- (void) resetMarkers{
    
};

@end
