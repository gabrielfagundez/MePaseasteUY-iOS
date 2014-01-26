//
//  MPUYMap.h
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 26/01/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAP_SPAN_X 0.10
#define MAP_SPAN_Y 0.10
#define INITIAL_LATITUDE -34.9106488
#define INITIAL_LONGITUDE -56.1683374

@interface MPUYMap : NSObject {
    NSNumber *_mapSpanX;
    NSNumber *_mapSpanY;
    NSNumber *_initialLatitude;
    NSNumber *_initialLongitude;
}

@property (strong, nonatomic, readonly) NSNumber *mapSpanX;
@property (strong, nonatomic, readonly) NSNumber *mapSpanY;
@property (strong, nonatomic, readonly) NSNumber *initialLatitude;
@property (strong, nonatomic, readonly) NSNumber *initialLongitude;

@end
