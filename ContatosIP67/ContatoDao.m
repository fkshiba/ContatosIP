//
//  ContatoDao.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import "ContatoDao.h"
@interface ContatoDao()
@property NSMutableArray *contatos;
@end

@implementation ContatoDao
static ContatoDao *defaultDao = nil;

+ (instancetype) contatoDaoInstance {
    if (!defaultDao) {
        defaultDao = [ContatoDao new];
    }
    return defaultDao;
}

- (void) adicionaContato:(Contato *)contato {
    [self.contatos addObject: contato];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setContatos:[NSMutableArray new]];
    }
    return self;
}

- (NSMutableArray *) todosContatos {
    return self.contatos;
}

- (NSInteger)total {
    return [self.contatos count];
}

- (Contato *) contatoDaPosicao:(NSInteger)posicao {
    return self.contatos[posicao];
}
@end
