//
//  MPUYServerResponse.h
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 13/02/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPUYServerResponse : NSObject {
    NSInteger codigo;
    NSDictionary * json;
}

- (id)initialize :(NSInteger)c :(NSDictionary*)j;
- (NSInteger)getCodigo;
- (NSDictionary *)getJson;

@end
