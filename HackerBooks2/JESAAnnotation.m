#import "JESAAnnotation.h"
#import "JESABook.h"

@interface JESAAnnotation ()

// Private interface goes here.

@end

@implementation JESAAnnotation

+(NSArray *) observableKeys{
    // La nota se crea con una foto por lo que observamos que se cambia photoData ya que no se creará de nuevo.
    return @[JESAAnnotationAttributes.text, JESAAnnotationRelationships.photo, JESAAnnotationRelationships.book];
}

+(void) annotationWithName:(NSString *) text
                      book:(JESABook *) book
                   context:(NSManagedObjectContext *) context{
    
    JESAAnnotation *annotation = [JESAAnnotation insertInManagedObjectContext:context];
    
    annotation.text = text;
    annotation.book = book;
    annotation.creationDate = [NSDate date];
    annotation.modificationDate = [NSDate date];
}

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    self.modificationDate = [NSDate date];
}

@end
