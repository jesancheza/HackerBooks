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
#import "JESAAnnotation.h"
#import "JESAAnnotationsViewController.h"

@interface JESABookViewController ()

@end

@implementation JESABookViewController

-(id) initWithModel:(JESABook *) model
            context:(NSManagedObjectContext *) context{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
        _context = context;
        self.title = [model title];
    }
    return self;
}

#pragma mark - View Lifecycle
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
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
- (IBAction)addFavorite:(id)sender{
    
    if ([self.model.isFavorite intValue] == 1) {
        self.favoriteButton.title = @"☆";
        self.model.isFavorite = [NSNumber numberWithBool:NO];
    }else{
        self.favoriteButton.title = @"★";
        self.model.isFavorite = [NSNumber numberWithBool:YES];
    }
}

- (IBAction)addAnnotation:(id)sender{
    
    // Datos de pruebas
    [JESAAnnotation annotationWithName:@"Pruebas"
                                  book:self.model
                               context:self.context];
    
    [JESAAnnotation annotationWithName:@"Anotacion de pruebas"
                                  book:self.model
                               context:self.context];
    
    [JESAAnnotation annotationWithName:@"Siguiente anotación"
                                  book:self.model
                               context:self.context];
    
    // Crear el fechRequest
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[JESAAnnotation entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:JESAAnnotationAttributes.text
                                                          ascending:YES],
                            [NSSortDescriptor sortDescriptorWithKey:JESAAnnotationAttributes.modificationDate
                                                          ascending:NO],
                            [NSSortDescriptor sortDescriptorWithKey:JESAAnnotationAttributes.creationDate
                                                          ascending:NO]];
    
    req.predicate = [NSPredicate predicateWithFormat:@"book == %@", self.model];
    
    // Crear el fechResultController
    NSFetchedResultsController *fC = [[NSFetchedResultsController alloc]
                                      initWithFetchRequest:req
                                      managedObjectContext:self.context
                                      sectionNameKeyPath:nil
                                      cacheName:nil];
    
    // layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(140, 150);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    // Creamos el controlador de anotaciones
    JESAAnnotationsViewController *annotationVC = [JESAAnnotationsViewController coreDataCollectionViewControllerWithFetchedResultsController:fC layout:layout];
    
    // lo pusheamos
    [self.navigationController pushViewController:annotationVC
                                         animated:YES];
}

- (IBAction)readBook:(id)sender{
    // Crear un simplePDFVC
    JESASimplePdfViewController *pVC = [[JESASimplePdfViewController alloc] initWithModel:self.model];
    
    // Hacer un push
    [self.navigationController pushViewController:pVC animated:YES];
}

#pragma mark - Utils
-(void) syncViewWithModel{
    
    self.photoView.image = self.model.photo.image;
    
    if ([self.model.isFavorite intValue] == 1) {
        self.favoriteButton.title = @"★";
    }else{
        self.favoriteButton.title = @"☆";
    }
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
