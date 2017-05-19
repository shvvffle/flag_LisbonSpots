//
//  Spot.h
//  LisbonSpots
//
//  Created by Marina Marques on 11/05/17.
//  Copyright (c) 2017 Flag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>

@interface Spot : NSManagedObject <MKAnnotation>

@property (nonatomic) NSString *spotName;
@property (nonatomic) NSString *spotType;
@property (nonatomic) NSString *spotPhone;
@property (nonatomic) NSString *spotDesc;
@property (nonatomic) double spotLat;
@property (nonatomic) double spotLong;
@property (nonatomic) NSNumber *spotId;

+ (instancetype) spotWithName: (NSString*) name andCoord: (CLLocationCoordinate2D) coord;
- (CLLocationCoordinate2D) coordinate;
+ (instancetype) spotWithDictionary: (NSDictionary*) lisbonSpot;
+ (NSArray*) allLisbonSpots;
- (NSString*) title;
- (NSString*) description;

@end
