//
//  GerenciadorDeAcoes.m
//  ContatosIP67
//
//  Created by ios5778 on 07/11/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import "GerenciadorDeAcoes.h"

@implementation GerenciadorDeAcoes

- (void) mostraAcoesDoController:(UIViewController *)controller {
    UIActionSheet *opcoes = [[UIActionSheet alloc] initWithTitle:@"Ações" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil
                       otherButtonTitles:@"Ligar", @"Enviar SMS", @"Mandar Email", @"Acessar site", @"Mostrar no mapa", nil];
    self.controller = controller;
    [opcoes showInView:self.controller.view];
}

- (id)initWithContato:(Contato *)contato {
    self = [self init];
    if (self) {
        self.contato = contato;
    }
    return self;
}

- (void)actionSheet: (UIActionSheet *) actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [self ligar];
            break;
        case 1:
            [self mandarSms];
            break;
        case 2:
            [self enviarEmail];
            break;
        case 3:
            [self abrirSite];
            break;
        case 4:
            [self mostrarMapa];
            break;
        default:
            break;
    }
}

- (void) abrirAplicativoDaUrl: (NSString *) url {
    UIApplication *app = [UIApplication sharedApplication];
    [app openURL:[NSURL URLWithString:url]];
}

- (void) ligar {
    UIDevice *device = [UIDevice currentDevice];
    if (![device.model isEqualToString:@"iPhone"]) {
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"WTF?" message:@"Telefone não disponível" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alerta show];
    }
    NSString *url = [NSString stringWithFormat:@"tel:%@", self.contato.telefone];
    [self abrirAplicativoDaUrl:url];
}

- (void) mandarSms {
    NSString *url = [NSString stringWithFormat:@"sms:%@", self.contato.telefone];
    [self abrirAplicativoDaUrl:url];
}

- (void) enviarEmail {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *enviador = [MFMailComposeViewController new];
        [enviador setToRecipients:@[self.contato.email]];
        [enviador setSubject:@"Assunto bacanudo"];
        enviador.mailComposeDelegate = self;
        [self.controller presentViewController:enviador animated:YES completion:nil];
    }
}

- (void) mailComposeController: (MFMailComposeViewController *) mail didFinishWithResult:(MFMailComposeResult)result {
    [self.controller dismissViewControllerAnimated:YES completion:nil];
}

- (void) abrirSite {
    [self abrirAplicativoDaUrl:self.contato.site];
}

- (void) mostrarMapa {
    NSString *url = [[NSString stringWithFormat:@"http://maps.apple.com?q=%@", self.contato.endereco]
                     stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self abrirAplicativoDaUrl:url];
}

@end
