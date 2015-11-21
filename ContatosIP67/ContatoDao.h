//
//  ContatoDao.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Contato.h"

@interface ContatoDao : NSObject
+ (instancetype) contatoDaoInstance;
- (void) adicionaContato: (Contato *) contato;
- (NSMutableArray *) todosContatos;
- (NSInteger) total;
- (Contato *) contatoDaPosicao: (NSInteger) posicao;
- (void) removeContatoDaPosicao: (NSInteger) posicao;
- (NSInteger) posicaoDoContato: (Contato *) contato;
- (Contato *) novoContato;

//core data
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@end
