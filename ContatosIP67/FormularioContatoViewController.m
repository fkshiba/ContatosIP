//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import "FormularioContatoViewController.h"
#import "Contato.h"
#import "ContatoDao.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

- (IBAction)pegaDadosDoFormulario {
    Contato *contato = [Contato new];
    contato.nome = self.nome.text;
    contato.email = self.email.text;
    contato.site = self.site.text;
    contato.endereco = self.endereco.text;
    contato.telefone = self.telefone.text;
    
    ContatoDao *dao = [ContatoDao contatoDaoInstance];
    [dao adicionaContato:contato];
    
    NSLog(@"Dados: %@", [dao todosContatos]);
}

- (id) init {
    self = [super init];
    NSLog(@"init");
    return self;
}

- (id) initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    NSLog(@"initWithCoder");
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
