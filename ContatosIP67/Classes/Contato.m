//
//  Contato.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import "Contato.h"

@implementation Contato
-(NSString *) description {
    return [NSString stringWithFormat:@"Nome: %@ Email: %@ Site: %@ Endereco: %@ Telefone: %@",
            self.nome, self.email, self.site, self.endereco, self.telefone];
}
@end
