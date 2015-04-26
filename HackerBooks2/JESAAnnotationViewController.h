//
//  JESAAnnotationViewController.h
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 26/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JESAAnnotation;

@interface JESAAnnotationViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *creationDateView;
@property (weak, nonatomic) IBOutlet UILabel *modificationDateView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIToolbar *bottomBar;

@property(nonatomic,strong) NSManagedObjectContext *context;
@property (nonatomic, strong) JESAAnnotation *model;

- (IBAction)showPhoto:(id)sender;

-(id) initWithModel:(JESAAnnotation *)model context:(NSManagedObjectContext *) context;

@end
