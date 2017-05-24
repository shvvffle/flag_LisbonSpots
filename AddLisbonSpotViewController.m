//
//  AddLisbonSpotViewController.m
//  LisbonSpots
//
//  Created by Marina Marques on 23/05/17.
//  Copyright (c) 2017 Flag. All rights reserved.
//

#import "AddLisbonSpotViewController.h"
#import "TableViewController.h"
#import <MapKit/MapKit.h>

@interface AddLisbonSpotViewController () <UITextFieldDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nSpotName;
@property (weak, nonatomic) IBOutlet UITextField *nSpotPhone;
@property (weak, nonatomic) IBOutlet UITextField *nSpotType;
@property (weak, nonatomic) IBOutlet UITextView *nSpotDescription;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation AddLisbonSpotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView.delegate = self;
}

- (IBAction)saveInfo:(UIButton *)sender {
    
    NSDictionary *newLisbonSpots = @{@"type": _nSpotType.text,
                                     @"name": _nSpotName.text,
                                     @"phone": _nSpotPhone.text,
                                     @"desc": _nSpotDescription.text,
                                     @"latitude": [NSString stringWithFormat:@"%f", _mapView.centerCoordinate.latitude],
                                     @"longitude":[NSString stringWithFormat:@"%f", _mapView.centerCoordinate.longitude]};
    
    [Spot spotWithDictionary: newLisbonSpots];
    
    TableViewController *gotoTableView = [self.storyboard
instantiateViewControllerWithIdentifier:@"TableViewController"];
    
    [self.navigationController pushViewController:gotoTableView animated:YES];
}


- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    MKCoordinateRegion newRegion = MKCoordinateRegionMake(_mapView.userLocation.coordinate,
                                                          MKCoordinateSpanMake(0.05, 0.05));
    
    [_mapView setRegion: newRegion animated:NO];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
