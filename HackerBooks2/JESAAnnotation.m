#import "JESAAnnotation.h"

@interface JESAAnnotation ()

// Private interface goes here.

@end

@implementation JESAAnnotation

-(UIImage *) image{
    
    // Convertimos el NSData en UIImage
    return [UIImage imageWithData:self.photoData];
}

-(void) setImage:(UIImage *)image{
    
    // Convertimos la imagen UIImage en NSData
    self.photoData = UIImageJPEGRepresentation(image, 0.9);
}

@end
