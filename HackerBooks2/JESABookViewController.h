//
//  JESABookViewController.h
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 13/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

@import UIKit;
@class JESABook;
#import "JESALibraryViewController.h"

@interface JESABookViewController : UIViewController <UISplitViewControllerDelegate, JESALibraryViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *favoriteButton;

@property(nonatomic,strong) JESABook *model;
@property(nonatomic,strong) NSManagedObjectContext *context;

-(id) initWithModel:(JESABook *) model context:(NSManagedObjectContext *) context;

- (IBAction)addFavorite:(id)sender;
- (IBAction)addAnnotation:(id)sender;
- (IBAction)readBook:(id)sender;

@end
