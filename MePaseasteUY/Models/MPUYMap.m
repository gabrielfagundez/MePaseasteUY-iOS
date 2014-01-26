//
//  MPUYMap.m
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 26/01/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import "MPUYMap.h"

@implementation MPUYMap

- (NSNumber *) mapSpanX {
    if(_mapSpanX == nil){
        _mapSpanX = [NSNumber numberWithFloat: MAP_SPAN_X];
    }
    return _mapSpanX;
}

- (NSNumber *) mapSpanY {
    if(_mapSpanY == nil){
        _mapSpanY = [NSNumber numberWithFloat: MAP_SPAN_Y];
    }
    return _mapSpanY;
}

- (NSNumber *) initialLatitude {
    if(_initialLatitude == nil){
        _initialLatitude = [NSNumber numberWithFloat: INITIAL_LATITUDE];
    }
    return _initialLatitude;
}

- (NSNumber *) initialLongitude {
    if(_initialLongitude == nil){
        _initialLongitude = [NSNumber numberWithFloat: INITIAL_LONGITUDE];
    }
    return _initialLongitude;
}

@end
