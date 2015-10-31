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
@property Contato *contato;
@end

@implementation FormularioContatoViewController

- (void) pegaDadosDoFormulario {
    self.contato.nome = self.nome.text;
    self.contato.email = self.email.text;
    self.contato.site = self.site.text;
    self.contato.endereco = self.endereco.text;
    self.contato.telefone = self.telefone.text;
    
    ContatoDao *dao = [ContatoDao contatoDaoInstance];
    [dao adicionaContato:self.contato];
    
    NSLog(@"Dados: %@", [dao todosContatos]);
}

- (void) criaContato {
    self.contato = [Contato new];
    [self pegaDadosDoFormulario];
    [self.navigationController popViewControllerAnimated:YES];
}

- (id) init {
    self = [super init];
    NSLog(@"init");
    return self;
}

- (id) initWithCoder:(NSCoder *) coder
{
    self = [super initWithCoder: coder];
    if (self) {
        self.navigationItem.title = @"Novo";
        UIBarButtonItem *botaoCadastrar = [[UIBarButtonItem alloc] initWithTitle:@"Salvar" style:UIBarButtonItemStyleDone
                                                                          target:self action:@selector(criaContato)];
        self.navigationItem.rightBarButtonItem = botaoCadastrar;
    }
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
