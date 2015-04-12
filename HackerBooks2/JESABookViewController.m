//
//  JESABookViewController.m
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 13/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESABookViewController.h"
#import "JESABook.h"

@interface JESABookViewController ()

@end

@implementation JESABookViewController

-(id) initWithModel:(JESABook *) model{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
        self.title = [model title];
    }
    return self;
}

#pragma mark - View Lifecycle
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Sincronizamos modelo -> vista
    [self syncViewWithModel];
    
    // Si estoy dentro de un SplitVC me pongo el botón
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;

}

#pragma mark - Utils
-(void) syncViewWithModel{
    self.titleView.text = self.model.title;
    self.photoView.image = self.model.image;
    self.authorsView.text = self.model.authors;
    
}

@end
