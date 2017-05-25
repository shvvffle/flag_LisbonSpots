//
//  DetailTableViewController.m
//  LisbonSpots
//
//  Created by Marina Marques on 17/05/17.
//  Copyright (c) 2017 Flag. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "DetailTableViewController.h"
#import "TableViewController.h"

@interface DetailTableViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *spotName;
@property (weak, nonatomic) IBOutlet UILabel *spotType;
@property (weak, nonatomic) IBOutlet UITextView *spotPhone;
@property (weak, nonatomic) IBOutlet UITextView *spotDescription;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _spotName.text = _spot.spotName;
    _spotType.text = _spot.spotType;
    _spotDescription.text = _spot.spotDesc;
    _spotPhone.text = _spot.spotPhone;
    
    _mapView.delegate = self;
    
    [_mapView addAnnotation:_spot];
}

#pragma mark - MKAnnotation methods

// change custom pins

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if([annotation isKindOfClass: [MKUserLocation class]]) {
        return nil;
    }
    
    MKAnnotationView *view = [[MKAnnotationView alloc]
                              initWithAnnotation:annotation reuseIdentifier:@"pin"];
    
    if (view == nil) {
        view = [[MKPinAnnotationView alloc] initWithAnnotation: annotation reuseIdentifier: @"lisbonSpots"];
    } else {
        view.annotation = annotation;
    }
    
    view.image =[UIImage imageNamed:@"map-pin-.png"];
    
    [view setEnabled:YES];
    [view setCanShowCallout:YES];
    
    return view;
    
}

@end
