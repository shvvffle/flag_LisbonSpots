//
//  LisbonSpotsService.m
//  LisbonSpots
//
//  Created by Marina Marques on 03/05/17.
//  Copyright (c) 2017 Flag. All rights reserved.
//

#import "LisbonSpotsService.h"
#import "Spot.h"

@implementation LisbonSpotsService

+ (NSURL*) serviceURL {
    return [NSURL URLWithString: @"https://franciscocosta.net/lisbon-spots"];
}

+ (BOOL) lisbonSpots:(NSDictionary *)spots callback:(id<LisbonSpotsServiceInvoker>)invoker {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [LisbonSpotsService serviceURL]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error != nil) {
            NSLog(@"Response: %@", response);
            NSLog(@"Error: %@", error);
            return;
        }

    NSDictionary *lisbonSpots = [NSJSONSerialization JSONObjectWithData:data
                                                                options:NSJSONReadingAllowFragments error: &error];
 
        
        
    for (NSDictionary *item in lisbonSpots) {
        [Spot spotWithDictionary:item];
    }
        
    }];
    
    
    [task resume];
    
    return YES;
}

@end

