//
//  ViewController.m
//  LisbonSpots
//
//  Created by Marina Marques on 03/05/17.
//  Copyright (c) 2017 Flag. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "ViewController.h"
#import "LisbonSpotsService.h"
#import "Spot.h"
#import "DetailMapViewController.h"

@interface ViewController () <MKMapViewDelegate, LisbonSpotsServiceInvoker>

@property CLLocationManager *locationManager;
@property Spot *selectedSpot;
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager requestAlwaysAuthorization];
    
    _map.delegate = self;
    
    NSArray *lisbonSpots = [Spot allLisbonSpots];
    [_map addAnnotations: lisbonSpots];
    
}

- (IBAction)showUserLocation:(UIButton *)sender {
    
    MKCoordinateRegion newRegion;
    newRegion.center = _map.userLocation.coordinate;
    
    [_map setRegion:newRegion animated: YES];
}


- (IBAction)sliderChanged:(UISlider *)sender {
    
    MKCoordinateRegion newRegion = MKCoordinateRegionMake(_map.userLocation.coordinate,
                                                          MKCoordinateSpanMake(sender.value, sender.value));
    
    [_map setRegion: newRegion animated:NO];
}


#pragma mark - MKMapViewDelegate methods

- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    _map.centerCoordinate = userLocation.location.coordinate;
    _slider.value = mapView.region.span.latitudeDelta;
    
}

#pragma mark - MKAnnotation methods

// change custom pins

- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation {
    
    //UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"map-pin-.png"]];
    
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
    
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        view.image =[UIImage imageNamed:@"map-pin-.png"];
    
        [view setEnabled:YES];
        [view setCanShowCallout:YES];
        return view;
        
    }

// send to detail view after clicking on custom pin

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    _selectedSpot = view.annotation;
    [self performSegueWithIdentifier:@"segueMaptoDetail" sender:self];
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.destinationViewController isKindOfClass: [DetailMapViewController class]]) {
        DetailMapViewController *target = segue.destinationViewController;
        
        target.spot = _selectedSpot;
    }
}

@end
    
