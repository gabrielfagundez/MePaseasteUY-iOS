//
//  MPUYMarkersViewController.m
//  MePaseasteUY
//
//  Created by Gabriel Fagundez de los Reyes on 27/01/14.
//  Copyright (c) 2014 Gabriel Fagundez de los Reyes. All rights reserved.
//

#import "MPUYMarkersViewController.h"
#import "MPUYMarkerTableViewCell.h"
#import "MPUYMarkers.h"
#import "MPUYAppDelegate.h"
#import "MPUYMarkerDetailViewController.h"

@interface MPUYMarkersViewController ()

@end

@implementation MPUYMarkersViewController

@synthesize spinner;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMarkersArrayFromDelegate];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    // Reload data to handle the case that the user added a new marker
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.markersArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // This is the identifier of the cell
    static NSString *CellIdentifier = @"MarkerTableViewCell";
    
    // Get the table cell
    MPUYMarkerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Set the Latitude/Longitude of the point
    NSString *latitude = [[self.markersArray objectAtIndex:indexPath.row] objectForKey:@"latitude"];
    NSString *longitude = [[self.markersArray objectAtIndex:indexPath.row] objectForKey:@"longitude"];
    cell.markerLatitudeLongitude.text = [MPUYMarkers formattedPosition:latitude :longitude];
    
    // Set the geocodedPosition
    NSString *geocodedPosition = [[self.markersArray objectAtIndex:indexPath.row] objectForKey:@"geocodedPosition"];
    if ([geocodedPosition  isEqual: @""]){
        cell.markerGeocodedLocation.text = @"Getting address...";
    }
    
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"MarkerDetailViewSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSLog(@"%@", [self.markersArray objectAtIndex:indexPath.row]);
        
        MPUYMarkerDetailViewController *destViewController = segue.destinationViewController;
        destViewController.latitude = [[self.markersArray objectAtIndex:indexPath.row] objectForKey:@"latitude"];
        destViewController.longitude = [[self.markersArray objectAtIndex:indexPath.row] objectForKey:@"longitude"];
    }
}


#pragma mark - Private markers methods
- (void) setMarkersArrayFromDelegate {
    
    // We take the array from the app delegate
    MPUYAppDelegate *appDelegate = (MPUYAppDelegate*) [UIApplication sharedApplication].delegate;
    self.markersArray = appDelegate.markers;
    
}

#pragma mark - View details methods
- (void) showSpinner {
    spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.color=[UIColor grayColor];
    spinner.center = self.view.center;
    [self.view addSubview: spinner];
    
    [spinner setHidden:NO];
    [spinner startAnimating];
}

@end
