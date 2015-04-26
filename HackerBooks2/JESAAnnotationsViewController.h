//
//  JESAAnnotationsViewController.h
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 26/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "AGTCoreDataCollectionViewController.h"
@class JESABook;

@interface JESAAnnotationsViewController : AGTCoreDataCollectionViewController

-(id) initWithFechedResultsController:(NSFetchedResultsController *) aFetchedResultsController
                                 book:(JESABook *) book
                               layout:(UICollectionViewFlowLayout *) layout;

@end
