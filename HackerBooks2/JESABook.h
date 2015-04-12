#import "_JESABook.h"

@interface JESABook : _JESABook {}

// Métodos de clase
+(instancetype) bookWithTitle:(NSString *) title
                        photo:(NSData *) image
                         book:(JESAPdf *) bookPdf
                         tags:(NSSet *) tags
                      authors:(NSString *) authors
                   isFavorite:(NSNumber *) isFavorite
                      context:(NSManagedObjectContext *) context;


@end
