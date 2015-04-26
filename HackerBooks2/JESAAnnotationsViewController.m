//
//  JESAAnnotationsViewController.m
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 26/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESAAnnotationsViewController.h"
#import "JESAAnnotation.h"
#import "JESABook.h"
#import "JESAAnnotationCellView.h"

static NSString *cellId = @"AnnotationCellId";

@interface JESAAnnotationsViewController ()
@property (nonatomic, strong) JESABook *book;
@end

@implementation JESAAnnotationsViewController

#pragma mark - Init
-(id) initWithFechedResultsController:(NSFetchedResultsController *) aFetchedResultsController
                                 book:(JESABook *)book{
    
    /*if (self = [super initWithFetchedResultsController:aFetchedResultsController layout:(UICollectionViewLayout *)]){
        
        _book = book;
        
    }*/
    return self;
}

#pragma mark - lifecycle
-(void) viewDidLoad{
    [super viewDidLoad];
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self
                                                                         action:@selector(addNewAnnotation:)];
    
    self.navigationItem.rightBarButtonItem = add;
    
}

-(void) addNewAnnotation:(id) sender{
    
    [JESAAnnotation annotationWithName:@"Nueva Anotación"
                                  book:self.book
                               context:self.book.managedObjectContext];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self registerCell];
    
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.95
                                                            alpha:1];
    
    self.title = @"Anotaciones";
    
    //self.detailViewControllerClassName = NSStringFromClass([JESANoteViewController class]);
}

#pragma mark - cell registration

-(void) registerCell{
    UINib *nib = [UINib nibWithNibName:@"JESAAnnotationCellView"
                                bundle:nil];
    
    [self.collectionView registerNib:nib
          forCellWithReuseIdentifier:cellId];
}

#pragma mark - DataSource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // Obtener el objeto
    JESAAnnotation *anotation = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Obtener la celda
    JESAAnnotationCellView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId
                                                                       forIndexPath:indexPath];
    
    // Configurar la celda
    [cell observeAnnotation:anotation];
    
    //Devolverla
    return cell;
    
}

@end
