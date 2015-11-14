//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"
#import "ContatoDao.h"

@interface ListaContatosViewController ()
@property ContatoDao *dao;
@property Contato *contatoSelecionado;
@end

@implementation ListaContatosViewController

- (id) init {
    self = [super init];
    if (self) {
        UIBarButtonItem *botaoAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action: @selector(exibeFormulario)];
        self.navigationItem.title = @"Contatos";
        self.navigationItem.rightBarButtonItem = botaoAdd;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.dao = [ContatoDao contatoDaoInstance];
        self.linha = -1;
    }
    UIImage *img = [UIImage imageNamed:@"lista-contatos.png"];
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Lista" image:img tag:0];
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dao total];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identificador = @"Celula";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identificador];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }
    Contato *contato = [self.dao contatoDaPosicao: indexPath.row];
    cell.textLabel.text = contato.nome;
    return cell;
}

- (void) exibeFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
    FormularioContatoViewController *form = [storyboard instantiateViewControllerWithIdentifier: @"FormContato"];
    if (self.contatoSelecionado) {
        form.contato = self.contatoSelecionado;
    }
    form.delegate = self;
    [self.navigationController pushViewController: form animated: YES];
}

- (void) chamaAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Formulario" message: @"Aqui vamos exibir o formulario" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style: UIAlertActionStyleDefault handler: nil];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated: YES completion: nil];
}

- (void) tableView: (UITableView *) tableView
        commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dao removeContatoDaPosicao: indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)contatoAdicionado:(Contato *)contato {
    self.linha = [self.dao posicaoDoContato:contato];
}

- (void)contatoAtualizado:(Contato *)contato {
    self.linha = [self.dao posicaoDoContato:contato];
}

- (void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    self.contatoSelecionado = [self.dao contatoDaPosicao:indexPath.row];
    [self exibeFormulario];
    self.contatoSelecionado = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    if (self.linha >= 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.linha inSection:0];
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
        self.linha = -1;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(exibeAcoes:)];
    
    [self.tableView addGestureRecognizer:longPress];
}

- (void)exibeAcoes: (UIGestureRecognizer *) gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint ponto = [gesture locationInView:self.tableView];
        NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:ponto];
        Contato *contato = [self.dao contatoDaPosicao:indexPath.row];
        self.gerenciador = [[GerenciadorDeAcoes alloc] initWithContato:contato];
        [self.gerenciador mostraAcoesDoController:self];
    }
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
