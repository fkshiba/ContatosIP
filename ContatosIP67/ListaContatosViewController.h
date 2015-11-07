//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormularioContatoViewController.h"
#import "GerenciadorDeAcoes.h"

@interface ListaContatosViewController : UITableViewController <FormularioContatoViewControllerDelegate>
@property NSInteger linha;
@property GerenciadorDeAcoes *gerenciador;
@end
