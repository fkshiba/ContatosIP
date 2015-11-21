//
//  Contato.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import "Contato.h"

@implementation Contato

@dynamic nome, email, site, endereco, telefone, foto, latitude, longitude;

-(NSString *) description {
    return [NSString stringWithFormat:@"Nome: %@ Email: %@ Site: %@ Endereco: %@ Telefone: %@",
            self.nome, self.email, self.site, self.endereco, self.telefone];
}

-(CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}

-(NSString *)title {
    return self.nome;
}

-(NSString *)subtitle {
    return self.endereco;
}
@end
