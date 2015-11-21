//
//  AppDelegate.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 ios5778. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDao.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ContatoDao *dao;

@end

