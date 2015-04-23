#import "JESAPhoto.h"
#import "Settings.h"
#import "JESAAnnotation.h"

@interface JESAPhoto ()

// Private interface goes here.

@end

@implementation JESAPhoto

+(NSArray *) observableKeys{
    // Observo las propiedades de las relaciones
    return @[JESAPhotoAttributes.photoData, JESAPhotoAttributes.url];
}

-(UIImage *) image{
    
    // Convertimos el NSData en UIImage
    return [UIImage imageWithData:self.photoData];
}

-(void) setImage:(UIImage *)image{
    
    // Convertimos la imagen UIImage en NSData
    self.photoData = UIImageJPEGRepresentation(image, 0.9);
}

#pragma mark - Class Methods
+(instancetype) photoWithURL:(NSString *) url
                     context:(NSManagedObjectContext *) context{
    
    return [[self alloc] initWithURL:url
                             context:context];
    
    
}

-(instancetype) initWithURL:(NSString *) url
                    context:(NSManagedObjectContext *) context{
    
    JESAPhoto *photo = [NSEntityDescription insertNewObjectForEntityForName:[JESAPhoto entityName]
                                                     inManagedObjectContext:context];
    
    photo.url = url;
    photo.photoData = UIImageJPEGRepresentation([UIImage imageNamed:@"noimage"], 0.9);
    
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0),^{
        
        NSURL *urlImage = [NSURL URLWithString:url];
        NSData *data = [NSData dataWithContentsOfURL:urlImage];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Lo hago en primer plano para asegurarme de
            // todas las ntificaciones van en la ocla
            // principal
            photo.photoData = data;
        });
    });
    
    return photo;
}

#pragma mark -  Notification
-(void)notifyChangeInImage{
    
    // avisamos delegado si lo tenemos
    //[self.delegate asyncImageDidChange:self];
    
    // Enviamos una notificación
    NSNotification *notification =
    [NSNotification notificationWithName: IMAGE_DID_CHANGE_NOTIFICATION
                                  object:self
                                userInfo:nil];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];

}

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    [self notifyChangeInImage];
        
}

@end
