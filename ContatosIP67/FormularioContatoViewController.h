//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"

@protocol FormularioContatoViewControllerDelegate <NSObject>
- (void) contatoAdicionado: (Contato *) contato;
- (void) contatoAtualizado:(Contato *)contato;

@end

@interface FormularioContatoViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField *nome;
@property (nonatomic, weak) IBOutlet UITextField *email;
@property (nonatomic, weak) IBOutlet UITextField *site;
@property (nonatomic, weak) IBOutlet UITextField *endereco;
@property (nonatomic, weak) IBOutlet UITextField *telefone;
@property Contato *contato;
@property (weak) id<FormularioContatoViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *botaoFoto;
- (IBAction)selecionaFoto;
@end

