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
    self.contatos = [[ContatoDao contatoDaoInstance] todosContatos];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.mapa addAnnotations:self.contatos];
}

-(void)viewWillDisappear:(BOOL)animated {
    [self.mapa removeAnnotations:self.contatos];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(nonnull id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass: [MKUserLocation class]]) {
        return nil;
    }
    static NSString *identificador = @"balao";
    MKPinAnnotationView *balao = (MKPinAnnotationView *)[self.mapa dequeueReusableAnnotationViewWithIdentifier:identificador];
    if (!balao) {
        NSLog(@"xxx");
        balao = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identificador];
    } else {
        balao.annotation = annotation;
    }
    balao.tintColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
    balao.canShowCallout = YES;
    Contato *contato = (Contato *) annotation;
    if (contato.foto) {
        UIImageView *imagemContato = [[UIImageView alloc]
                                      initWithFrame:CGRectMake(0.0, 0.0, 32.0, 32.0)];
        imagemContato.image = contato.foto;
        balao.leftCalloutAccessoryView = imagemContato;
    }
    return balao;
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
