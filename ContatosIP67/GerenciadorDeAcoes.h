//
//  GerenciadorDeAcoes.h
//  ContatosIP67
//
//  Created by ios5778 on 07/11/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Contato.h"
@import MessageUI;

@interface GerenciadorDeAcoes: NSObject<UIActionSheetDelegate, MFMailComposeViewControllerDelegate>
- (void)mostraAcoesDoController: (UIViewController *) controller;
- (id)initWithContato: (Contato *) contato;

@property Contato *contato;

@property (weak) UIViewController *controller;
@end
