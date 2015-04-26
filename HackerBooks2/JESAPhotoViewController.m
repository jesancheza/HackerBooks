//
//  JESAPhotoViewController.m
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 26/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESAPhotoViewController.h"
#import "JESAPhoto.h"
@import CoreImage;

@interface JESAPhotoViewController ()

@end

@implementation JESAPhotoViewController

#pragma mark - Init
-(id) initWithModel:(JESAPhoto *) model
              context:(NSManagedObjectContext *) context{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
        _context = context;
    }
    
    return self;
}

- (IBAction)takePicture:(id)sender {
    // Creamos un UIImagePickerController
    UIImagePickerController *picker = [UIImagePickerController new];
    
    // Lo configuro
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        // Uso la cámara
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        // Tiro del carrete
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    picker.delegate = self;
    
    // Modificamos la transición al mostrar la modal.
    // UIModalTransitionStylePartialCurl: Cuidado porque dependiendo del contenido puede que no desaparezca
    // la vista inferior y por lo tanto no se ejecuta ni el viewWillAppear ni viewWillDisappear.
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    // Lo muestro de forma modal
    [self presentViewController:picker
                       animated:YES completion:^{
                           // Esto se va a ejecutar cuando termine la animación que muestra al picker.
                       }];
}

- (IBAction)deletePhoto:(id)sender {
    // La eliminamos del modelo
    self.model.image = [UIImage imageNamed:@"noimage.png"];
    
    // Actualizamos la vista
    CGRect oldRect = self.photoView.bounds;
    [UIView animateWithDuration:0.7
                     animations:^{
                         
                         self.photoView.alpha = 0;
                         self.photoView.bounds = CGRectZero;
                         self.photoView.transform = CGAffineTransformMakeRotation(M_PI_2);
                     } completion:^(BOOL finished) {
                         
                         self.photoView.alpha = 1;
                         self.photoView.bounds = oldRect;
                         self.photoView.transform = CGAffineTransformIdentity;
                         self.photoView.image = self.model.image;
                     }];
}

#pragma mark - Life cycle
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Me aseguro que la vista no ocupa toda la pantalla
    // sino lo que queda dentro del navigation
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Sincronizo modelo -> vista
    self.photoView.image = self.model.image;
    
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    // Sincronizo vista -> model
    self.model.image = self.photoView.image;
}

#pragma mark - UIImagePickerControllerDelegate
-(void) imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    // Sacamos la UIImage del diccionario
    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // La guardo en el modelo
    self.model.image = img;
    
    // Quito de encima el controlador que estamos presentando
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 // Se ejecutará cuando se halla ocultado del todo
                             }];
}

@end
