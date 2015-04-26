#import "_JESAAnnotation.h"

@import UIKit;
@class JESABook;

@interface JESAAnnotation : _JESAAnnotation {}

+(void) annotationWithName:(NSString *) text
                      book:(JESABook *) book
                   context:(NSManagedObjectContext *) context;

@end
