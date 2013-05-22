//
//  LBSecondPageViewController.h
//  stickyMapsTableView
//
//  Created by saifuddin on 22/05/13.
//  Copyright (c) 2013 Brainstorm Technologies Sdn Bhd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface LBSecondPageViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property BOOL fastSwitching;
@end
