//
//  MPUYBackendProxy.h
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 13/02/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPUYServerResponse.h"

@interface MPUYBackendProxy : NSObject

+ (bool)internetConnection;
+ (MPUYServerResponse *) makeNewQuery:(NSArray *) markers;
+ (MPUYServerResponse *) geocodeAddress:(NSString *) latitude: (NSString *) longitude;

@end