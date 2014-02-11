//
//  MPUYMarkers.m
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 26/01/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import "MPUYMarkers.h"
#import "util.h"

@implementation MPUYMarkers

- (void) addMarker: (float)latitude :(float)longitude{
    
    // If neccesary, initialize the array
    if (self.markersArray == nil){
        self.markersArray = [[NSMutableArray alloc] init];
    };
    
    // Create the new marker
    NSDictionary *marker = [[NSDictionary alloc]
                            initWithObjectsAndKeys:
                                [NSNumber numberWithFloat:latitude], @"latitude",
                                [NSNumber numberWithFloat:longitude], @"longitude",
                                @"", @"geocodedPosition",
                            nil];
    
    // Add the last object
    [self.markersArray addObject:marker];
};

- (void) resetMarkers{
    self.markersArray = [[NSMutableArray alloc] init];
};

+ (NSString *) formattedPosition: (NSString *)latitude: (NSString *)longitude {
    NSString *formattedString = [NSString stringWithFormat:@"(%@, %@)", latitude, longitude];
    return formattedString;
};

@end
