//
//  ContatosNoMapaViewController.m
//  ContatosIP67
//
//  Created by ios5778 on 14/11/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import "ContatosNoMapaViewController.h"

@interface ContatosNoMapaViewController ()

@end

@implementation ContatosNoMapaViewController

-(instancetype)init {
    self = [super init];
    UIImage *img = [UIImage imageNamed:@"mapa-contatos.png"];
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:img tag:0];
    self.navigationItem.title = @"Localização";
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    MKUserTrackingBarButtonItem *botaoGps = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapa];
    self.navigationItem.rightBarButtonItem = botaoGps;
    self.manager = [CLLocationManager new];
    [self.manager requestWhenInUseAuthorization];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
