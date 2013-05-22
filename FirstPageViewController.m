//
//  FirstPageViewController.m
//  stickyMapsTableView
//
//  Created by saifuddin on 22/05/13.
//  Copyright (c) 2013 Brainstorm Technologies Sdn Bhd. All rights reserved.
//

#import "FirstPageViewController.h"
#import "LBSecondPageViewController.h"

@interface FirstPageViewController ()

@end

@implementation FirstPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Menu";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	cell.textLabel.text = (indexPath.row == 0) ? @"Fast switching" : @"Slow switching";
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	LBSecondPageViewController *secondPageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LBSecondPageViewController"];
	secondPageViewController.fastSwitching = (indexPath.row == 0) ? YES : NO;
	[self.navigationController pushViewController:secondPageViewController animated:YES];
}

@end
