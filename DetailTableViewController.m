//
//  DetailTableViewController.m
//  LisbonSpots
//
//  Created by Marina Marques on 17/05/17.
//  Copyright (c) 2017 Flag. All rights reserved.
//

#import "DetailTableViewController.h"
#import "TableViewController.h"

@interface DetailTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *spotName;
@property (weak, nonatomic) IBOutlet UILabel *spotType;
@property (weak, nonatomic) IBOutlet UITextView *spotPhone;
@property (weak, nonatomic) IBOutlet UILabel *spotLat;
@property (weak, nonatomic) IBOutlet UILabel *spotLong;
@property (weak, nonatomic) IBOutlet UITextView *spotDescription;

@end

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _spotName.text = _spot.spotName;
    _spotType.text = _spot.spotType;
    _spotDescription.text = _spot.spotDesc;
    _spotPhone.text = _spot.spotPhone;
    _spotLat.text = [NSString stringWithFormat:@"%f", _spot.spotLat];
    _spotLong.text = [NSString stringWithFormat:@"%f", _spot.spotLong];
}

@end
