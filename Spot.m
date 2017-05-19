//
//  Spot.m
//  LisbonSpots
//
//  Created by Marina Marques on 11/05/17.
//  Copyright (c) 2017 Flag. All rights reserved.
//

#import "Spot.h"
#import "AppDelegate.h"

@implementation Spot

@dynamic spotType;
@dynamic spotDesc;
@dynamic spotId;
@dynamic spotLat;
@dynamic spotLong;
@dynamic spotName;
@dynamic spotPhone;


+ (instancetype) spotWithName: (NSString*) name andCoord: (CLLocationCoordinate2D) coord {
    
    NSManagedObjectContext *moc = [AppDelegate sharedDelegate].managedObjectContext;
    
    Spot *spots = [NSEntityDescription insertNewObjectForEntityForName:@"Spot"
                                                  inManagedObjectContext:moc];
    
    
    spots.spotName = name;
    spots.spotLat = coord.latitude;
    spots.spotLong = coord.longitude;
    
    return spots;
    
}

- (CLLocationCoordinate2D) coordinate {
    
    return CLLocationCoordinate2DMake(self.spotLat, self.spotLong);
    
}

// receives the dictionary and stores it into core data (after looping through it)
+ (instancetype)spotWithDictionary:(NSDictionary *)lisbonSpot {
    
    NSManagedObjectContext *moc = [AppDelegate sharedDelegate].managedObjectContext;
    
    Spot *spots = [NSEntityDescription insertNewObjectForEntityForName:@"Spot"
                                                inManagedObjectContext:moc];
    
    spots.spotType = [lisbonSpot objectForKey:@"type"];
    spots.spotId = [lisbonSpot objectForKey:@"id"];
    spots.spotName = [lisbonSpot objectForKey:@"name"];
    spots.spotPhone =  [lisbonSpot objectForKey:@"phone"];
    spots.spotDesc = [lisbonSpot objectForKey:@"desc"];
    spots.spotLat = [[lisbonSpot objectForKey:@"latitude"] doubleValue];
    spots.spotLong = [[lisbonSpot objectForKey:@"longitude"] doubleValue];
    
    [[AppDelegate sharedDelegate] saveContext]; // save to database
    
    return spots;
}

// get data from coreData
+ (NSArray*) allLisbonSpots {
    
    NSManagedObjectContext *moc = [AppDelegate sharedDelegate].managedObjectContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Spot"];
    
    NSError *error;
    NSArray *result = [moc executeFetchRequest:request error:&error];
    
    if(error != nil) {
        NSLog(@"[Spot allLisbonSpots] -> %@", error.description);
        return nil;
    }

    NSLog(@"[Spot allLisbonSpots] -> %@", result);
 
    return result;
    
}


- (NSString*) title {
    return self.spotName;
}


- (NSString*) description {
    
    return [NSString stringWithFormat:@"%@, %@, %@, %@", self.spotName, self.spotPhone, self.spotType, self.spotDesc];
    
}

@end
