//
//  JESABookViewController.m
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 13/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESABookViewController.h"
#import "JESABook.h"
#import "JESAPhoto.h"
#import "Settings.h"
#import "JESASimplePdfViewController.h"

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
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Toolbar
    [self.navigationController setToolbarHidden:NO];
    
    //Comprobamos favoritos
    NSString *buttonFav = @"";
    if (self.model.isFavorite == [NSNumber numberWithBool:YES]) {
        buttonFav = @"★";
    }else{
        buttonFav = @"☆";
    }
    
    // Creamos botones para el toolbar
    UIBarButtonItem *buttonFavorite = [[UIBarButtonItem alloc] initWithTitle: buttonFav
                                                                       style: UIBarButtonItemStyleDone
                                                                      target: self
                                                                      action: @selector(addFavorite)];
    
    UIBarButtonItem *addNotification = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                     target:self
                                                                                     action:@selector(addNotification)];
    
    UIBarButtonItem *buttonReadPdf = [[UIBarButtonItem alloc] initWithTitle:@"Leer libro"
                                                                      style:UIBarButtonItemStyleDone
                                                                     target:self
                                                                     action:@selector(displaySimplePDF)];
    
    // Botón de espacio
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                           target:nil
                                                                           action:nil];
    
    // Añadimos botones al toolbar
    self.toolbarItems = @[buttonFavorite, space, addNotification, space, buttonReadPdf];
    
    // Sincronizamos modelo -> vista
    [self syncViewWithModel];
    
    // Si estoy dentro de un SplitVC me pongo el botón
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    
    // Alta en notificaciones
    [self setupNotifications];

}

-(void) dealloc{
    [self tearDownNotifications];
}

#pragma mark - Actions
- (IBAction)displaySimplePDF {
    // Crear un simplePDFVC
    JESASimplePdfViewController *pVC = [[JESASimplePdfViewController alloc] initWithModel:self.model];
    
    // Hacer un push
    [self.navigationController pushViewController:pVC animated:YES];
}

-(IBAction) addFavorite{
    
}

-(IBAction) addNotification{
    
}

#pragma mark - Utils
-(void) syncViewWithModel{
    self.titleView.text = self.model.title;
    self.photoView.image = self.model.photo.image;
    self.authorsView.text = self.model.authors;
    
}

#pragma mark - UISplitViewControllerDelegate
-(void) splitViewController:(UISplitViewController *)svc
    willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
    // Averiguar si la tabla se ve o no
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        // La tabla está oculta y cuelga del botón
        // Ponemos ese botón en mi barra de navegación
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
    }else{
        // Se muestra la tabla: oculto el botón de la barra de navegación
        self.navigationItem.leftBarButtonItem = nil;
    }
}

#pragma mark - JESALibraryTableViewControllerDelegate
-(void) libraryViewController:(JESALibraryViewController *) uVC
                didSelectBook:(JESABook *) book{
    
    // Sincronizo el modelo
    self.model = book;
    
    // Sincornizo el modelo con la vista
    [self syncViewWithModel];
}

#pragma mark -  Notifications
-(void) setupNotifications{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
           selector:@selector(notifyThatImageDidChange:)
               name:IMAGE_DID_CHANGE_NOTIFICATION
             object:nil];
    
}

-(void) tearDownNotifications{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}

//IMAGE_DID_CHANGE_NOTIFICATION
-(void)notifyThatImageDidChange:(NSNotification*) notification{
    
    JESAPhoto *photo = [notification object];
    if (self.model == photo.book) {
        self.photoView.image = photo.image;
    }
}

@end
