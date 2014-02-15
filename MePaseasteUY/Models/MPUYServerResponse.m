//
//  MPUYServerResponse.m
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 13/02/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import "MPUYServerResponse.h"

@implementation MPUYServerResponse

- (id)initialize :(NSInteger)c :(NSDictionary*)j {
    
    if (self == [super init]){
        codigo = c;
        json = j;
    }
    return self;
}

- (NSInteger)getCodigo{
    return codigo;
}

- (NSDictionary *)getJson{
    return json;
}

@end
