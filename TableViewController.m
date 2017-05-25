//
//  TableViewController.m
//  LisbonSpots
//
//  Created by Marina Marques on 16/05/17.
//  Copyright (c) 2017 Flag. All rights reserved.
//

#import "TableViewController.h"
#import "Spot.h"
#import "DetailTableViewController.h"
#import "RestaurantTableViewCell.h"
#import "ClubTableViewCell.h"
#import "BarTableViewCell.h"

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>
@property Spot *selectedSpot;
@property (strong,nonatomic) UITableView *table;
@property (strong,nonatomic) NSArray *restaurantSpots;
@property (strong,nonatomic) NSArray *barSpots;
@property (strong,nonatomic) NSArray *clubSpots;
@property (strong,nonatomic) NSArray *lisbonSpots;

@end

@implementation TableViewController

- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    _lisbonSpots = [Spot allLisbonSpots];
    
    
    // filter core data to get the types
    NSPredicate *fetchRestaurantSpots = [NSPredicate predicateWithFormat:@"%K = %@", @"spotType", @"restaurant"];
    NSPredicate *fetchBarSpots = [NSPredicate predicateWithFormat:@"%K = %@", @"spotType", @"bar"];
    NSPredicate *fetchClubSpots = [NSPredicate predicateWithFormat:@"%K = %@", @"spotType", @"club"];
    
    // create filtered containers per type
    NSArray *restaurantSpotsContainer = [_lisbonSpots filteredArrayUsingPredicate:fetchRestaurantSpots];
    NSArray *clubSpotsContainer = [_lisbonSpots filteredArrayUsingPredicate:fetchClubSpots];
    NSArray *barSpotsContainer = [_lisbonSpots filteredArrayUsingPredicate:fetchBarSpots];
    
    self.restaurantSpots = restaurantSpotsContainer;
    self.clubSpots = clubSpotsContainer;
    self.barSpots = barSpotsContainer;
    
    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.restaurantSpots.count;
    }
    
    if (section == 1) {
        return self.barSpots.count;
    }
    
    if (section == 2) {
        return self.clubSpots.count;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifierRest = @"CellRestaurant";
    static NSString *CellIdentifierBar = @"CellBar";
    static NSString *CellIdentifierClub = @"CellClub";
    
    UITableViewCell *cell;

        if (indexPath.section == 0) {
            RestaurantTableViewCell *restCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierRest];
            restCell.labelRest.text = [[self.restaurantSpots objectAtIndex:indexPath.row] spotName];
            
            return restCell;
        }
    
        if (indexPath.section == 1) {
            BarTableViewCell *barCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierBar];
            barCell.labelBar.text = [[self.barSpots objectAtIndex:indexPath.row] spotName];
            
            return barCell;
        }
    
        if (indexPath.section == 2) {
            ClubTableViewCell *clubCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierClub];
            clubCell.labelClub.text = [[self.clubSpots objectAtIndex:indexPath.row] spotName];
            
            return clubCell;
        }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return @"Restaurants";
    }
    
    if (section == 1) {
        return @"Bars";
    }
    
    if (section == 2) {
        return @"Clubs";
    }
    
    return @"undefined";
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSIndexPath *selectedIndexPath = [tableView indexPathForSelectedRow];
    
    if (selectedIndexPath.section == 0) {
        _selectedSpot = [self.restaurantSpots objectAtIndex:selectedIndexPath.row];
    }
    
    if (selectedIndexPath.section == 1) {
        _selectedSpot = [self.barSpots objectAtIndex:selectedIndexPath.row];
    }
    
    if (selectedIndexPath.section == 2) {
       _selectedSpot = [self.clubSpots objectAtIndex:selectedIndexPath.row];
    }

    [self performSegueWithIdentifier:@"segueSpotDetail" sender:indexPath];
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"segueSpotDetail"]) {
        DetailTableViewController *detailView = [segue destinationViewController];
        detailView.spot = _selectedSpot;
    }
}

@end
