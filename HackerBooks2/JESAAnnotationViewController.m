//
//  JESAAnnotationViewController.m
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 26/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESAAnnotationViewController.h"
#import "JESAAnnotation.h"

@interface JESAAnnotationViewController ()

@end

@implementation JESAAnnotationViewController

#pragma mark - Init
-(id) initWithModel:(JESAAnnotation *) model
            context:(NSManagedObjectContext *) context{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]){
        _model = model;
        self.title = @"Annotation";
    }
    
    return self;
}

#pragma mark - Life cycle
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    // Sincronizar el modelo -> vista
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    
    self.creationDateView.text = [fmt stringFromDate:self.model.creationDate];
    self.modificationDateView.text = [fmt stringFromDate:self.model.modificationDate];
    
    // Texto
    self.textView.text = self.model.text;
}

#pragma mark - UITextFieldDelegate
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    // Buen momento para validar el texto
    if ([textField.text length] > 0){
        [textField resignFirstResponder];
        
        return YES;
    }
    return NO;
}

-(void) textFieldDidEndEditing:(UITextField *)textField{
    
    // Es buen momento para guardar el texto
}

-(void) setupKeyboardNotifications{
    
    // Alta en notificaciones
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillAppear:)
               name:UIKeyboardWillShowNotification
             object:nil];
    
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillDisappear:)
               name:UIKeyboardWillHideNotification
             object:nil];
}

-(void) tearDownKeyboardNotifications{
    
    // Nos damos de baja
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc removeObserver:self];
}

// UIKeyboardWillShowNotification
-(void) notifyThatKeyboardWillAppear:(NSNotification *) n{
    
    // Sacar la duración de la animación del teclado
    double duration = [[n.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Sacar el tamaño (bounds) del teclado del objeto
    // userInfo que viene en la notificación
    NSValue *wrappedFrame = [n.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect kbdFrame = [wrappedFrame CGRectValue];
    
    // Calcular los nuevos bounds de self.textView
    // Hacerlo con una animación que coincida con la del teclado
    CGRect currentFrame = self.textView.frame;
    
    CGRect newRect = CGRectMake(currentFrame.origin.x,
                                currentFrame.origin.y,
                                currentFrame.size.width,
                                currentFrame.size.height -
                                kbdFrame.size.height +
                                self.bottomBar.frame.size.height);
    
    [UIView animateWithDuration:duration
                     animations:^{
                         self.textView.frame = newRect;
                     }];
    
}

// UIKeyboardWillHideNotification
-(void) notifyThatKeyboardWillDisappear:(NSNotification *) n{
    
    // Sacar la duración de la animación del teclado
    double duration = [[n.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Devolver a self.textView su bounds original mediante una animación que coincide con la
    // del teclado
    [UIView animateWithDuration:duration
                     animations:^{
                         self.textView.frame = CGRectMake(8, 166, 304, 350);
                     }];
    
}


@end
