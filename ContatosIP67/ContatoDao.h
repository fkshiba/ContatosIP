//
//  ContatoDao.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDao : NSObject
+ (instancetype) contatoDaoInstance;
- (void) adicionaContato: (Contato *) contato;
- (NSMutableArray *) todosContatos;
- (NSInteger) total;
- (Contato *) contatoDaPosicao: (NSInteger) posicao;
@end
