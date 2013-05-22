//
//  LBSecondPageViewController.m
//  stickyMapsTableView
//
//  Created by saifuddin on 22/05/13.
//  Copyright (c) 2013 Brainstorm Technologies Sdn Bhd. All rights reserved.
//

#import "LBSecondPageViewController.h"
#import "MKMapView+ZoomLevel.h"

@interface LBSecondPageViewController ()
@property (nonatomic, strong) NSArray *places;
@property NSInteger currentVisibleRow;
@end

@implementation LBSecondPageViewController

@synthesize places, mapView, tableView, currentVisibleRow, fastSwitching;

- (void)viewDidLoad
{
    [super viewDidLoad];
	currentVisibleRow = -1;
	self.places = @[
					[[CLLocation alloc] initWithLatitude:3.139573 longitude:101.68705],
					[[CLLocation alloc] initWithLatitude:3.02327 longitude:101.515045],
					[[CLLocation alloc] initWithLatitude:3.24541 longitude:101.549377],
					[[CLLocation alloc] initWithLatitude:3.139573 longitude:101.68705],
					[[CLLocation alloc] initWithLatitude:3.02327 longitude:101.515045],
					[[CLLocation alloc] initWithLatitude:3.139573 longitude:101.68705],
					[[CLLocation alloc] initWithLatitude:3.02327 longitude:101.515045],
					[[CLLocation alloc] initWithLatitude:3.24541 longitude:101.549377],
					[[CLLocation alloc] initWithLatitude:3.139573 longitude:101.68705],
					[[CLLocation alloc] initWithLatitude:3.02327 longitude:101.515045],
					[[CLLocation alloc] initWithLatitude:3.24541 longitude:101.549377],
					[[CLLocation alloc] initWithLatitude:3.139573 longitude:101.68705],
					[[CLLocation alloc] initWithLatitude:3.02327 longitude:101.515045],
					[[CLLocation alloc] initWithLatitude:3.139573 longitude:101.68705],
					[[CLLocation alloc] initWithLatitude:3.02327 longitude:101.515045],
					[[CLLocation alloc] initWithLatitude:3.24541 longitude:101.549377],
					[[CLLocation alloc] initWithLatitude:3.139573 longitude:101.68705],
					[[CLLocation alloc] initWithLatitude:3.02327 longitude:101.515045],
					[[CLLocation alloc] initWithLatitude:3.24541 longitude:101.549377]
				  ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *identifier = @"cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	
	if (!cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
	}
	CLLocation *location = places[indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"%f, %f",location.coordinate.latitude, location.coordinate.longitude];
	return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSIndexPath *firstVisibleIndexPath = [[tableView indexPathsForVisibleRows] objectAtIndex:0];
	if (currentVisibleRow != firstVisibleIndexPath.row && fastSwitching)
	{
		currentVisibleRow = firstVisibleIndexPath.row;
//		NSLog(@"first visible cell's section: %i, row: %i", firstVisibleIndexPath.section, firstVisibleIndexPath.row);
		CLLocation *location = places[firstVisibleIndexPath.row];
		[mapView setCenterCoordinate:location.coordinate zoomLevel:10 animated:YES];
	}
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSIndexPath *firstVisibleIndexPath = [[tableView indexPathsForVisibleRows] objectAtIndex:0];
	if (currentVisibleRow != firstVisibleIndexPath.row && !fastSwitching)
	{
		currentVisibleRow = firstVisibleIndexPath.row;
		//		NSLog(@"first visible cell's section: %i, row: %i", firstVisibleIndexPath.section, firstVisibleIndexPath.row);
		CLLocation *location = places[firstVisibleIndexPath.row];
		[mapView setCenterCoordinate:location.coordinate zoomLevel:10 animated:YES];
	}
}

@end
