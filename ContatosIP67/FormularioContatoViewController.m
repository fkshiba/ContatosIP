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
    self.contato.foto = self.botaoFoto.currentBackgroundImage;
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
        if (self.contato.foto) {
            [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
            [self.botaoFoto setBackgroundImage:self.contato.foto forState:UIControlStateNormal];
        }
        
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
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Escolhe a foto" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Câmera", @"Galeria", nil];
        [sheet showInView:self.view];
    } else {
        UIImagePickerController *picker = [UIImagePickerController new];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *imagem = [info valueForKey:UIImagePickerControllerEditedImage];
    [self.botaoFoto setBackgroundImage:imagem forState:UIControlStateNormal];
    [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    if (buttonIndex == 0) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else if (buttonIndex == 1) {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    } else {
        return;
    }
    [self presentViewController:picker animated:YES completion:nil];
}

-(IBAction)buscarCoordenadas {
    CLGeocoder *geocoder = [CLGeocoder new];
}

@end
