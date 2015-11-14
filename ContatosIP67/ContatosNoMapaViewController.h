//
//  ContatosNoMapaViewController.h
//  ContatosIP67
//
//  Created by ios5778 on 14/11/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ContatosNoMapaViewController : UIViewController
@property IBOutlet MKMapView *mapa;
@property CLLocationManager *manager;
@end
