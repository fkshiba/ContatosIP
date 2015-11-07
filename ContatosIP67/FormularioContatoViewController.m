//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import "FormularioContatoViewController.h"
#import "ContatoDao.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

- (void) pegaDadosDoFormulario {
    if (!self.contato) {
        self.contato = [Contato new];
    }
    self.contato.nome = self.nome.text;
    self.contato.email = self.email.text;
    self.contato.site = self.site.text;
    self.contato.endereco = self.endereco.text;
    self.contato.telefone = self.telefone.text;
}

- (void) criaContato {
    self.contato = [Contato new];
    [self pegaDadosDoFormulario];
    ContatoDao *dao = [ContatoDao contatoDaoInstance];
    [dao adicionaContato:self.contato];
    [self.delegate contatoAdicionado: self.contato];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)atualizaContato {
    [self pegaDadosDoFormulario];
    [self.delegate contatoAtualizado:self.contato];
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
    }
    NSLog(@"initWithCoder");
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *botaoSalvar = nil;
    if (self.contato) {
        self.nome.text = self.contato.nome;
        self.email.text = self.contato.email;
        self.site.text = self.contato.site;
        self.endereco.text = self.contato.endereco;
        self.telefone.text = self.contato.telefone;
        
        //create different buttons for editing and creating contacts
        botaoSalvar = [[UIBarButtonItem alloc] initWithTitle:@"Atualizar" style:UIBarButtonItemStylePlain target:self action:@selector(atualizaContato)];
    } else {
        botaoSalvar = [[UIBarButtonItem alloc] initWithTitle:@"Criar" style:UIBarButtonItemStylePlain target:self action:@selector(criaContato)];
    }
    self.navigationItem.rightBarButtonItem = botaoSalvar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selecionaFoto {
    NSLog(@"Clicou no botao de foto!");
}
@end
