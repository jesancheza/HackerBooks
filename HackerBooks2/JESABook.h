#import "_JESABook.h"
@import UIKit;

@interface JESABook : _JESABook {}

// Métodos de clase
+(instancetype) objectWithArchivedURIRepresentation:(NSData*)archivedURI
                                            context:(NSManagedObjectContext *) context;

+(instancetype) bookWithTitle:(NSString *) title
                        photo:(JESAPhoto *) image
                         book:(JESAPdf *) bookPdf
                         tags:(NSSet *) tags
                      authors:(NSString *) authors
                   isFavorite:(NSNumber *) isFavorite
                      context:(NSManagedObjectContext *) context;

+(instancetype) bookWithDictionary:(NSDictionary *) dic
                           context:(NSManagedObjectContext *) context;

-(instancetype) initWithTitle:(NSString *) title
                        photo:(JESAPhoto *) image
                         book:(JESAPdf *) bookPdf
                         tags:(NSSet *) tags
                      authors:(NSString *) authors
                   isFavorite:(NSNumber *) isFavorite
                      context:(NSManagedObjectContext *) context;


@end
