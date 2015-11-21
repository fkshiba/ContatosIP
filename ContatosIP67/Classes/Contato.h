//
//  Contato.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreData/CoreData.h>
@import UIKit;

@interface Contato : NSManagedObject <MKAnnotation>
@property NSString *nome;
@property NSString *email;
@property NSString *site;
@property NSString *endereco;
@property NSString *telefone;
@property UIImage *foto;
@property NSNumber *latitude;
@property NSNumber *longitude;
@end
