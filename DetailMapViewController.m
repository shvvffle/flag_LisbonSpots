//
//  DetailMapViewController.m
//  LisbonSpots
//
//  Created by Marina Marques on 16/05/17.
//  Copyright (c) 2017 Flag. All rights reserved.
//

#import "DetailMapViewController.h"
#import "ViewController.h"

@interface DetailMapViewController ()
@property (weak, nonatomic) IBOutlet UILabel *spotName;
@property (weak, nonatomic) IBOutlet UILabel *spotType;
@property (weak, nonatomic) IBOutlet UITextView *spotPhone;
@property (weak, nonatomic) IBOutlet UITextView *spotDescription;
@property (weak, nonatomic) IBOutlet UILabel *spotLat;
@property (weak, nonatomic) IBOutlet UILabel *spotLong;

@end

@implementation DetailMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _spotName.text = _spot.spotName;
    _spotType.text = _spot.spotType;
    _spotDescription.text = _spot.spotDesc;
    _spotPhone.text = _spot.spotPhone;
    _spotLat.text = [NSString stringWithFormat:@"%f", _spot.spotLat];
    _spotLong.text = [NSString stringWithFormat:@"%f", _spot.spotLong];

}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
