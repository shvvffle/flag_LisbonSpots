//
//  LisbonSpotsService.h
//  LisbonSpots
//
//  Created by Marina Marques on 03/05/17.
//  Copyright (c) 2017 Flag. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LisbonSpotsServiceInvoker <NSObject>

@end

@interface LisbonSpotsService : NSObject

+ (NSURL*) serviceURL;
+ (BOOL) lisbonSpots: (NSString*) spots callback:(id<LisbonSpotsServiceInvoker>)invoker;

@end
