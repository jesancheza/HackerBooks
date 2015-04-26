//
//  JESAAnnotationCellView.m
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 26/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESAAnnotationCellView.h"
#import "JESAAnnotation.h"
#import "JESAPhoto.h"

@interface JESAAnnotationCellView()
@property (strong, nonatomic) JESAAnnotation *annotation;
@end

@implementation JESAAnnotationCellView

+(NSArray *) keys{
    
    return @[@"modificationDate",@"photo.image"];
}

-(void) observeAnnotation:(JESAAnnotation *) annotation{
    
    // Guardarla en la propiedad
    self.annotation = annotation;
    
    // Observar ciertas propiedades
    for (NSString *key in [JESAAnnotationCellView keys]) {
        [self.annotation addObserver:self
                    forKeyPath:key
                       options:NSKeyValueObservingOptionNew
                       context:NULL];
    }
    
    [self syncWithAnnotation];
}

-(void) syncWithAnnotation{
    
    // Configurar la celda
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterMediumStyle;
    self.modificationDateView.text = [fmt stringFromDate:self.annotation.modificationDate];
    
    UIImage *img;
    if (self.annotation.photo.image == nil) {
        img = [UIImage imageNamed:@"noimage.png"];
    }else{
        img = self.annotation.photo.image;
    }
    
    self.photoView.image = img;
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    [self syncWithAnnotation];
    
}

-(void) prepareForReuse{
    
    self.annotation = nil;
    
    [self syncWithAnnotation];
}

@end
