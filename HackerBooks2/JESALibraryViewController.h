//
//  JESALibraryViewController.h
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 12/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
@class JESALibraryViewController;
@class JESABook;

@protocol JESALibraryViewControllerDelegate <NSObject>

@optional
-(void) libraryViewController:(JESALibraryViewController *) uVC didSelectBook:(JESABook *) book;

@end

@interface JESALibraryViewController : AGTCoreDataTableViewController <JESALibraryViewControllerDelegate>

@property(weak, nonatomic) id<JESALibraryViewControllerDelegate> delegate;

@end
