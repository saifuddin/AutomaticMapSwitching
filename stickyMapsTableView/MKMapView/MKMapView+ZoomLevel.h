//
//  MKMapView+ZoomLevel.h
//  t4us-iOS
//
//  Created by saifuddin on 5/31/11.
//  Copyright 2011 Brainstorm Technologies Sdn Bhd. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (ZoomLevel)

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
				  zoomLevel:(NSUInteger)zoomLevel
				   animated:(BOOL)animated;

- (NSInteger)zoomLevel;
- (void)tryToFitAnnotations;

@end