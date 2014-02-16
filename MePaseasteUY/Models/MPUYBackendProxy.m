//
//  MPUYBackendProxy.m
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 13/02/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import "MPUYBackendProxy.h"
#import "Reachability.h"
#import "MPUYServerResponse.h"

@implementation MPUYBackendProxy

NSString * host                 = @"http://www.mepaseaste.uy";
NSString * rechabilityHost      = @"www.mepaseaste.uy";
NSString * newQueryUrl          = @"/api/queries";

+ (bool)internetConnection{
    
    // Check connection to the server
    Reachability * networkReachability = [Reachability reachabilityWithHostName:rechabilityHost];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable){
        //si no hay conexion con el server
        return false;
    }
    
    return true;
}

+ (MPUYServerResponse *) makeNewQuery:(NSArray *) markers{
    
    // Create the JSON
    NSDictionary * jsonHash = [NSDictionary dictionaryWithObjectsAndKeys:
                               markers, @"markers",
                               @"diurna", @"tipo_tarifa",
                               nil
                               ];
    
    // Create the url
    NSString * url = [host copy];
    url = [url stringByAppendingString:newQueryUrl];
    
    // Make the HTTP POST
    NSMutableURLRequest * request = [NSMutableURLRequest
                                    requestWithURL:[NSURL URLWithString:url]];
    
    // Temporal variables
    NSError * error;
    NSData * postData = [NSJSONSerialization dataWithJSONObject:jsonHash options:0 error:&error];
    
    // Create the request
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    
    // --------------------------------
    // Log the request - Just to verify
    NSLog(@"Request: %@", [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding]);
    // --------------------------------
    
    NSHTTPURLResponse * urlResponse = nil;
    error = [[NSError alloc] init];
    
    // Make the request
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString * result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    // --------------------------------
    // Log the response - Just to verify
    NSLog(@"Response: %@", result);
    NSLog(@"Response: %ld", (long)urlResponse.statusCode);
    // --------------------------------
    
    
    // Differenciate between Success and Error
    if ((long)urlResponse.statusCode == 200) {
        
        // Make a JSON from to handle server response
        NSError * jsonParsingError = nil;
        NSDictionary * data = [NSJSONSerialization JSONObjectWithData:responseData
                                                              options:0
                                                                error:&jsonParsingError];
        
        // Create the Server Response object
        MPUYServerResponse * sr = [MPUYServerResponse alloc];
        sr = [sr initialize :(NSInteger)urlResponse.statusCode :data];
        
        return sr;
    }
    else {
        
        // Return an empty Server Response Object
        MPUYServerResponse * sr = [MPUYServerResponse alloc];
        sr = [sr initialize :(NSInteger)urlResponse.statusCode :NULL];
        
        return sr;
    }
};


@end
